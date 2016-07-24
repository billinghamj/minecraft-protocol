//
//  StatusPacket.cpp
//  MinecraftProtocol
//
//  Created by James Billingham on 05/19/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#include "StatusPacket.h"

using namespace MinecraftProtocol::Packets::StatusCB;

void StatusPacket::Read(PacketReader *reader)
{
	jsonResponse = reader->ReadString();
}

void StatusPacket::Write(PacketWriter *writer)
{
	writer->WriteString(jsonResponse);
}
