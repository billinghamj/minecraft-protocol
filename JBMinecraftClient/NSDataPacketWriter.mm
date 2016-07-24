//
//  NSDataPacketWriter.mm
//  JBMinecraftClient
//
//  Created by James Billingham on 05/27/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#import "NSDataPacketWriter.h"
#import "Endianness.h"
#import "StringUtils.h"

using namespace MinecraftProtocol;

NSDataPacketWriter::NSDataPacketWriter(NSMutableData *data) : data(data)
{
}

void NSDataPacketWriter::WriteBool(bool value)
{
	WriteUByte(value ? 1 : 0);
}

void NSDataPacketWriter::WriteByte(int8_t value)
{
	[data appendBytes:(const char *)&value length:sizeof(value)];
}

void NSDataPacketWriter::WriteUByte(uint8_t value)
{
	[data appendBytes:(const char *)&value length:sizeof(value)];
}

void NSDataPacketWriter::WriteShort(int16_t value)
{
	uint16_t val = htons((uint16_t)value);
	[data appendBytes:(const char *)&val length:sizeof(val)];
}

void NSDataPacketWriter::WriteUShort(uint16_t value)
{
	value = htons(value);
	[data appendBytes:(const char *)&value length:sizeof(value)];
}

void NSDataPacketWriter::WriteInt(int32_t value)
{
	uint32_t val = htonl((uint32_t)value);
	[data appendBytes:(const char *)&val length:sizeof(val)];
}

void NSDataPacketWriter::WriteUInt(uint32_t value)
{
	value = htonl(value);
	[data appendBytes:(const char *)&value length:sizeof(value)];
}

void NSDataPacketWriter::WriteLong(int64_t value)
{
	uint64_t val = HostToNetwork8(&value);
	[data appendBytes:(const char *)&val length:sizeof(val)];
}

void NSDataPacketWriter::WriteULong(uint64_t value)
{
	value = HostToNetwork8(&value);
	[data appendBytes:(const char *)&value length:sizeof(value)];
}

void NSDataPacketWriter::WriteFloat(float value)
{
	uint32_t val = HostToNetwork4(&value);
	[data appendBytes:(const char *)&val length:sizeof(val)];
}

void NSDataPacketWriter::WriteDouble(double value)
{
	uint64_t val = HostToNetwork8(&value);
	[data appendBytes:(const char *)&val length:sizeof(val)];
}

void NSDataPacketWriter::WriteString(std::string value)
{
	WriteVarInt((short)value.size());
	[data appendBytes:value.data() length:value.size()];
}

void NSDataPacketWriter::WriteVarInt(int64_t value)
{
	// A 64-bit integer can be encoded by at most 5 bytes
	unsigned char bytes[10];
	size_t index = 0;

	do
	{
		bytes[index] = (value & 0x7f) | ((value > 0x7f) ? 0x80 : 0x00);
		value = value >> 7;
		index++;
	}
	while (value > 0);

	[data appendBytes:(const char *)bytes length:index];
}
