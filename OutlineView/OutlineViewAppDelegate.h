//
//  OutlineViewAppDelegate.h
//  OutlineView
//
//  Created by huangliang on 12/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OutlineViewAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSOutlineView *outlineView;
	NSTreeController *treeController;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSOutlineView *outlineView;
@property (assign) IBOutlet NSTreeController *treeController;
@end
