//
//  NSDataPacketWriter.h
//  JBMinecraftClient
//
//  Created by James Billingham on 05/27/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JBMinecraftClient/PacketReader.h>

namespace MinecraftProtocol
{
  class NSDataPacketReader : public PacketReader
	{
	public:
		NSDataPacketReader(NSData *data);

		uint64_t GetPosition();
		void SetPosition(uint64_t value);

		virtual bool ReadBool();
		virtual int8_t ReadByte();
		virtual uint8_t ReadUByte();
		virtual int16_t ReadShort();
		virtual uint16_t ReadUShort();
		virtual int32_t ReadInt();
		virtual uint32_t ReadUInt();
		virtual int64_t ReadLong();
		virtual uint64_t ReadULong();
		// todo? 128-bit integer
		virtual float ReadFloat();
		virtual double ReadDouble();
		virtual std::string ReadString();
		virtual int64_t ReadVarInt();

	private:
		NSData *data;
		uint64_t position;
	};
}
