//
//  HandshakePacket.cpp
//  MinecraftProtocol
//
//  Created by James Billingham on 05/18/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#include "HandshakePacket.h"

using namespace MinecraftProtocol::Packets::Handshaking;

void HandshakePacket::Read(PacketReader *reader)
{
	protocolVersion = (Version)reader->ReadVarInt();
	serverAddress = reader->ReadString();
	serverPort = reader->ReadUShort();
	nextState = (State)reader->ReadVarInt();
}

void HandshakePacket::Write(PacketWriter *writer)
{
	writer->WriteVarInt((int64_t)protocolVersion);
	writer->WriteString(serverAddress);
	writer->WriteUShort(serverPort);
	writer->WriteVarInt((int64_t)nextState);
}
