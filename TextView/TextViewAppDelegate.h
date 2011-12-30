//
//  TextViewAppDelegate.h
//  TextView
//
//  Created by huangliang on 12/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TextViewAppDelegate : NSObject <NSApplicationDelegate, NSTextDelegate, NSTextViewDelegate> {
    NSWindow *window;
	NSTextView *textView;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextView *textView;

- (IBAction)showPanel:(id)sender;

@end
