//
//  Backend.h
//  Document
//
//  Created by huangliang on 1/5/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Backend : NSObject<NSCoding> {
	NSDate *dateValue;
	BOOL boolValue;
	NSInteger maxValue;
	NSInteger minValue;
	NSInteger currentValue;
	NSArray *arrayValue;
	NSString *currentSelected;
	NSString *stringValue;
}

@property (retain) NSDate *dateValue;
@property BOOL boolValue;
@property NSInteger maxValue;
@property NSInteger minValue;
@property NSInteger currentValue;
@property (retain) NSArray *arrayValue;
@property (retain) NSString *currentSelected;
@property (retain) NSString *stringValue;

@end
