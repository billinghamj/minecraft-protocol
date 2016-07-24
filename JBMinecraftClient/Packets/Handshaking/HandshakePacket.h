//
//  HandshakePacket.h
//  MinecraftProtocol
//
//  Created by James Billingham on 05/18/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#ifndef __MinecraftProtocol__Packets__Handshaking__HandshakePacket__
#define __MinecraftProtocol__Packets__Handshaking__HandshakePacket__

#include <string>
#include <JBMinecraftClient/Packets/Packet.h>
#include <JBMinecraftClient/State.h>
#include <JBMinecraftClient/Version.h>

namespace MinecraftProtocol
{
  namespace Packets
	{
		namespace Handshaking
		{
			class HandshakePacket : public Packet
			{
			public:
				static const uint64_t packetId = 0x00;

				Version protocolVersion;
				std::string serverAddress;
				uint16_t serverPort;
				State nextState;

				virtual void Read(PacketReader *reader);
				virtual void Write(PacketWriter *writer);
			};
		}
	}
}

#endif /* defined(__MinecraftProtocol__Packets__Handshaking__HandshakePacket__) */
