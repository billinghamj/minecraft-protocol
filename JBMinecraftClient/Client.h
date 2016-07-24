//
//  Client.h
//  JBMinecraftClient
//
//  Created by James Billingham on 05/26/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Client : NSObject

- (id)init __attribute__((unavailable("use initWithHost:port:")));
- (instancetype)initWithHost:(NSString *)host port:(NSInteger)port;

@end
