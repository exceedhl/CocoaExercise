//
//  ButtonAppDelegate.m
//  Button
//
//  Created by huangliang on 12/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ButtonAppDelegate.h"

@implementation ButtonAppDelegate

@synthesize window;
@synthesize button;

- (void)awakeFromNib {
	[button setShowsBorderOnlyWhileMouseInside:TRUE];
	[button setKeyEquivalent:@"\r"];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (IBAction)radioSelected:(id)sender {
	NSLog(@"select cell: %d", [[sender selectedCell] tag]);
	NSLog(@"selected cell title: %@", [[sender selectedCell] title]);
}

@end
