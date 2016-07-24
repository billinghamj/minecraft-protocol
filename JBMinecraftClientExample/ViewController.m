//
//  ViewController.m
//  JBMinecraftClientExample
//
//  Created by James Billingham on 05/27/14.
//  Copyright (c) 2014 James Billingham. All rights reserved.
//

#import "ViewController.h"
#import <JBMinecraftClient/Client.h>

@interface ViewController ()
{
	Client *_client;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	_client = [[Client alloc] initWithHost:@"127.0.0.1" port:25565];
}

@end
