//
//  PacketWriter.h
//  MinecraftProtocol
//
//  Created by James Billingham on 05/19/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#ifndef __MinecraftProtocol__PacketWriter__
#define __MinecraftProtocol__PacketWriter__

#include <string>
#include <vector>
#include <float.h>

// Source: http://wiki.vg/Data_Types

namespace MinecraftProtocol
{
  class PacketWriter
	{
	public:
		virtual void WriteBool(bool value) = 0;
		virtual void WriteByte(int8_t value) = 0;
		virtual void WriteUByte(uint8_t value) = 0;
		virtual void WriteShort(int16_t value) = 0;
		virtual void WriteUShort(uint16_t value) = 0;
		virtual void WriteInt(int32_t value) = 0;
		virtual void WriteUInt(uint32_t value) = 0;
		virtual void WriteLong(int64_t value) = 0;
		virtual void WriteULong(uint64_t value) = 0;
		// todo? 128-bit integer
		virtual void WriteFloat(float value) = 0;
		virtual void WriteDouble(double value) = 0;
		virtual void WriteString(std::string value) = 0;
		virtual void WriteVarInt(int64_t value) = 0;
	};
}

#endif /* defined(__MinecraftProtocol__PacketWriter__) */
