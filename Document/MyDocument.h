//
//  MyDocument.h
//  Document
//
//  Created by huangliang on 1/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Backend.h"

@interface MyDocument : NSDocument {
	Backend *backend;
}

@property (retain) Backend *backend;

@end
