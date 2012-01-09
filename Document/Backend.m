//
//  Backend.m
//  Document
//
//  Created by huangliang on 1/5/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Backend.h"

@implementation Backend

@synthesize dateValue;
@synthesize boolValue;
@synthesize minValue;
@synthesize maxValue;
@synthesize currentValue;
@synthesize arrayValue;
@synthesize currentSelected;
@synthesize stringValue;

- (id)initWithCoder:(NSCoder *)coder {
	dateValue = [[coder decodeObjectForKey:@"date"] retain];
	arrayValue = [[coder decodeObjectForKey:@"array"] retain];
	currentSelected = [[coder decodeObjectForKey:@"selected"] retain];
	stringValue = [[coder decodeObjectForKey:@"string"] retain];
	boolValue = [coder decodeBoolForKey:@"bool"];
	minValue = [coder decodeIntegerForKey:@"min"];
	maxValue = [coder decodeIntegerForKey:@"max"];
	currentValue = [coder decodeIntegerForKey:@"current"];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:dateValue forKey:@"date"];
	[coder encodeBool:boolValue forKey:@"bool"];
	[coder encodeInteger:minValue forKey:@"min"];
	[coder encodeInteger:maxValue forKey:@"max"];
	[coder encodeInteger:currentValue forKey:@"current"];
	[coder encodeObject:arrayValue forKey:@"array"];
	[coder encodeObject:currentSelected forKey:@"selected"];
	[coder encodeObject:stringValue forKey:@"string"];
}

- (void) dealloc {
	[dateValue release];
	[arrayValue release];
	[currentSelected release];
	[stringValue release];
	[super dealloc];
}

@end
