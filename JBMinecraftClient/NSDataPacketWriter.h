//
//  NSDataPacketWriter.h
//  JBMinecraftClient
//
//  Created by James Billingham on 05/27/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JBMinecraftClient/PacketWriter.h>

namespace MinecraftProtocol
{
  class NSDataPacketWriter : public PacketWriter
	{
	public:
		NSDataPacketWriter(NSMutableData *data);

		virtual void WriteBool(bool value);
		virtual void WriteByte(int8_t value);
		virtual void WriteUByte(uint8_t value);
		virtual void WriteShort(int16_t value);
		virtual void WriteUShort(uint16_t value);
		virtual void WriteInt(int32_t value);
		virtual void WriteUInt(uint32_t value);
		virtual void WriteLong(int64_t value);
		virtual void WriteULong(uint64_t value);
		// todo? 128-bit integer
		virtual void WriteFloat(float value);
		virtual void WriteDouble(double value);
		virtual void WriteString(std::string value);
		virtual void WriteVarInt(int64_t value);

	private:
		NSMutableData *data;
	};
}
