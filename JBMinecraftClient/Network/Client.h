//
//  Client.h
//  MinecraftProtocol
//
//  Created by James Billingham on 05/22/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#ifndef __MinecraftProtocol__Client__
#define __MinecraftProtocol__Client__

#include <stdint.h>
#include <string>
#include <JBMinecraftClient/Packets/Packet.h>

namespace MinecraftProtocol
{
  namespace Network
	{
		class Client
		{
		public:
			Client(std::string host, uint16_t);

			void Send(Packets::Packet *packet);
			void Receive(PacketWriter *writer);
		};
	}
}

#endif /* defined(__MinecraftProtocol__Client__) */
