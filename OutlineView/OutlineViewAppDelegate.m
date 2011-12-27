//
//  OutlineViewAppDelegate.m
//  OutlineView
//
//  Created by huangliang on 12/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OutlineViewAppDelegate.h"
#import "Files.h"

@implementation OutlineViewAppDelegate

@synthesize window;
@synthesize outlineView;
@synthesize treeController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	Files *dir = [[Files alloc] initWithDir:[NSURL fileURLWithPath:@"/Users/huangliang"]];
	[treeController setContent:dir];
	[treeController setChildrenKeyPath:@"children"];
	[treeController setCountKeyPath:@"count"];
	[treeController setLeafKeyPath:@"leaf"];
	[dir release];
}

@end
