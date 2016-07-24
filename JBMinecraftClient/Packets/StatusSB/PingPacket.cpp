//
//  PingPacket.cpp
//  MinecraftProtocol
//
//  Created by James Billingham on 05/19/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#include "PingPacket.h"

using namespace MinecraftProtocol::Packets::StatusSB;

void PingPacket::Read(PacketReader *reader)
{
	time = reader->ReadLong();
}

void PingPacket::Write(PacketWriter *writer)
{
	writer->WriteLong(time);
}
