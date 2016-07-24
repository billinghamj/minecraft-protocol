//
//  Client.m
//  JBMinecraftClient
//
//  Created by James Billingham on 05/26/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#import "Client.h"
#import "Packets/Handshaking/HandshakePacket.h"
#import "Packets/StatusSB/StatusPacket.h"
#import "Packets/StatusCB/StatusPacket.h"
#import "NSDataPacketWriter.h"
#import "NSDataPacketReader.h"
#import <CocoaAsyncSocket/GCDAsyncSocket.h>

using namespace MinecraftProtocol;
using namespace MinecraftProtocol::Packets;

@interface Client () <GCDAsyncSocketDelegate>
{
	GCDAsyncSocket *_sock;
}

@end

@implementation Client

- (instancetype)initWithHost:(NSString *)host port:(NSInteger)port
{
	if (self = [super init])
	{
		NSError *error;
		_sock = [[GCDAsyncSocket alloc] init];

		_sock.delegate = self;
		_sock.delegateQueue = dispatch_get_main_queue();

		if (![_sock connectToHost:host onPort:port withTimeout:5 error:&error])
			NSLog(@"Immediate connection failure - %@", error);
	}

	return self;
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
	NSLog(@"Socket connected");

	// perform handshake
	{
		Handshaking::HandshakePacket *handshake = new Handshaking::HandshakePacket();
		handshake->protocolVersion = Version::v5;
		handshake->serverAddress = std::string(host.UTF8String);
		handshake->serverPort = port;
		handshake->nextState = State::Status;
		[self sendPacket:handshake tag:0];
	}

	// request status
	{
		StatusSB::StatusPacket *status = new StatusSB::StatusPacket();
		[self sendPacket:status tag:1];
	}

	[sock readDataWithTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
	NSLog(@"Socket data read - #%ld - %@", tag, [self dataToHexString:data]);

	NSDataPacketReader *reader = new NSDataPacketReader(data);

	uint64_t payloadLen = reader->ReadVarInt();
	uint64_t payloadPtr = reader->GetPosition();
	uint64_t packetId = reader->ReadVarInt();

	uint64_t expectedLen = payloadLen + payloadPtr;
	uint64_t actualLen = data.length;

	if (actualLen != expectedLen)
	{
		NSLog(@"Received packet length invalid - expected: %llu, actual: %llu", expectedLen, actualLen);
		[sock readDataWithTimeout:-1 tag:tag + 1];
		return;
	}

	Packet *packet;

	switch (packetId)
	{
		case 0:
			packet = new StatusCB::StatusPacket();
			break;

		default:
			throw "unknown packet";
			break;
	}

	packet->Read(reader);

	[sock readDataWithTimeout:-1 tag:tag + 1];
}

- (void)socket:(GCDAsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
	NSLog(@"Socket partial data read - #%ld", tag);
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
	NSLog(@"Socket data write - #%ld", tag);
}

- (void)socket:(GCDAsyncSocket *)sock didWritePartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
	NSLog(@"Socket partial data write - #%ld", tag);
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
	NSLog(@"Socket disconnection - %@", err);
}

- (void)sendPacket:(Packet *)packet tag:(long)tag
{
	// write packet to data
	NSMutableData *data = [NSMutableData data];
	NSDataPacketWriter *writer = new NSDataPacketWriter(data);
	writer->WriteVarInt(packet->packetId);
	packet->Write(writer);

	// prepend `data` with data length
	{
		NSMutableData *preData = [NSMutableData data];
		NSDataPacketWriter *writer = new NSDataPacketWriter(preData);
		writer->WriteVarInt(data.length);

		[preData appendData:data];
		[data setData:preData];
	}

	// log exact packet data in hex
	NSLog(@"%@", [self dataToHexString:data]);

	// write data to socket
	[_sock writeData:data withTimeout:5 tag:tag];
}

- (NSString *)dataToHexString:(NSData *)data
{
	const unsigned char *buffer = (const unsigned char *)data.bytes;
	NSUInteger length = data.length;
	NSMutableString *hex = [NSMutableString stringWithCapacity:(length * 2)];

	for (int i = 0; i < length; ++i)
		[hex appendFormat:@"%02x", (unsigned int)buffer[i]];

	return hex;
}

@end
