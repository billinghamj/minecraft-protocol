//
//  Packet.h
//  MinecraftProtocol
//
//  Created by James Billingham on 05/18/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#ifndef __MinecraftProtocol__Packets__Packet__
#define __MinecraftProtocol__Packets__Packet__

#include <stdint.h>
#include <JBMinecraftClient/PacketReader.h>
#include <JBMinecraftClient/PacketWriter.h>

namespace MinecraftProtocol
{
  namespace Packets
	{
		class Packet
		{
		public:
			virtual static const uint64_t packetId;

			virtual void Read(PacketReader *reader) = 0;
			virtual void Write(PacketWriter *writer) = 0;
		};
	}
}

#endif /* defined(__MinecraftProtocol__Packet__) */
