//
//  ButtonAppDelegate.h
//  Button
//
//  Created by huangliang on 12/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ButtonAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSButton *button;

- (IBAction)radioSelected:(id)sender;
- (void)awakeFromNib;

@end
