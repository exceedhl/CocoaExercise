//
//  TableViewAppDelegate.h
//  TableView
//
//  Created by huangliang on 12/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TableViewAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSArrayController *arrayController;
@end
