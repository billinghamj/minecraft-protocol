//
//  PacketReader.h
//  MinecraftProtocol
//
//  Created by James Billingham on 05/19/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#ifndef __MinecraftProtocol__PacketReader__
#define __MinecraftProtocol__PacketReader__

#include <string>
#include <vector>
#include <float.h>

// Source: http://wiki.vg/Data_Types

namespace MinecraftProtocol
{
  class PacketReader
	{
	public:
		virtual bool ReadBool() = 0;
		virtual int8_t ReadByte() = 0;
		virtual uint8_t ReadUByte() = 0;
		virtual int16_t ReadShort() = 0;
		virtual uint16_t ReadUShort() = 0;
		virtual int32_t ReadInt() = 0;
		virtual uint32_t ReadUInt() = 0;
		virtual int64_t ReadLong() = 0;
		virtual uint64_t ReadULong() = 0;
		// todo? 128-bit integer
		virtual float ReadFloat() = 0;
		virtual double ReadDouble() = 0;
		virtual std::string ReadString() = 0;
		virtual int64_t ReadVarInt() = 0;
	};
}

#endif /* defined(__MinecraftProtocol__PacketReader__) */
