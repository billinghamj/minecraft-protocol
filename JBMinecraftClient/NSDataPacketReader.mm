//
//  NSDataPacketReader.mm
//  JBMinecraftClient
//
//  Created by James Billingham on 06/21/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#import "NSDataPacketReader.h"
#import "Endianness.h"
#import "StringUtils.h"

using namespace MinecraftProtocol;

NSDataPacketReader::NSDataPacketReader(NSData *data) : data(data)
{
}

uint64_t NSDataPacketReader::GetPosition()
{
	return position;
}

void NSDataPacketReader::SetPosition(uint64_t value)
{
	position = value;
}

bool NSDataPacketReader::ReadBool()
{
	return 0;
}

int8_t NSDataPacketReader::ReadByte()
{
	return 0;
}

uint8_t NSDataPacketReader::ReadUByte()
{
	return 0;
}

int16_t NSDataPacketReader::ReadShort()
{
	return 0;
}

uint16_t NSDataPacketReader::ReadUShort()
{
	return 0;
}

int32_t NSDataPacketReader::ReadInt()
{
	return 0;
}

uint32_t NSDataPacketReader::ReadUInt()
{
	return 0;
}

int64_t NSDataPacketReader::ReadLong()
{
	return 0;
}

uint64_t NSDataPacketReader::ReadULong()
{
	return 0;
}

float NSDataPacketReader::ReadFloat()
{
	return 0;
}

double NSDataPacketReader::ReadDouble()
{
	return 0;
}

std::string NSDataPacketReader::ReadString()
{
	return "";
}

int64_t NSDataPacketReader::ReadVarInt()
{
	return 0;
}

