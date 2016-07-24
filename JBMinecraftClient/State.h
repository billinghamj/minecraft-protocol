//
//  State.h
//  MinecraftProtocol
//
//  Created by James Billingham on 05/19/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#ifndef __MinecraftProtocol__State__
#define __MinecraftProtocol__State__

namespace MinecraftProtocol
{
  enum class State : int64_t
	{
		Handshaking = 0, // assumed
		Status = 1,
		Login = 2,
		Play = 3, // assumed
	};
}

#endif /* defined(__MinecraftProtocol__State__) */
