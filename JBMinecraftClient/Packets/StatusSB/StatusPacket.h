//
//  StatusPacket.h
//  MinecraftProtocol
//
//  Created by James Billingham on 05/19/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#ifndef __MinecraftProtocol__Packets__StatusSB__StatusPacket__
#define __MinecraftProtocol__Packets__StatusSB__StatusPacket__

#include <JBMinecraftClient/Packets/Packet.h>

namespace MinecraftProtocol
{
  namespace Packets
	{
		namespace StatusSB
		{
			class StatusPacket : public Packet
			{
			public:
				static const uint64_t packetId = 0x00;

				virtual void Read(PacketReader *reader);
				virtual void Write(PacketWriter *writer);
			};
		}
	}
}

#endif /* defined(__MinecraftProtocol__Packets__StatusSB__StatusPacket__) */
