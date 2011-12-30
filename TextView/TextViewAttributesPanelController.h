//
//  TextViewAttributesPanelController.h
//  TextView
//
//  Created by huangliang on 12/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TextViewAttributesPanelController : NSWindowController {
	id textViewAttributes;
	IBOutlet NSPanel *panel;
}

@property (assign) id textViewAttributes;
- (void)setBecomesKeyOnlyIfNeeded:(BOOL)becomesKeyOnlyIfNeeded;
@end
