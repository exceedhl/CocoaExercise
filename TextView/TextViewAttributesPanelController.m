//
//  TextViewAttributesPanelController.m
//  TextView
//
//  Created by huangliang on 12/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextViewAttributesPanelController.h"


@implementation TextViewAttributesPanelController
@synthesize textViewAttributes;
- (void)setBecomesKeyOnlyIfNeeded:(BOOL)becomesKeyOnlyIfNeeded {
	[panel setBecomesKeyOnlyIfNeeded:becomesKeyOnlyIfNeeded];
}
@end
