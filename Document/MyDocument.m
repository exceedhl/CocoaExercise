//
//  MyDocument.m
//  Document
//
//  Created by huangliang on 1/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MyDocument.h"
#import "FormWindowController.h"


@implementation MyDocument
@synthesize backend;

- (id)init {
	if (self = [super init]) {
		Backend *b = [[Backend alloc] init];
		b.boolValue = FALSE;
		b.dateValue = [NSDate date];
		b.minValue = 10;
		b.maxValue = 25;
		b.currentValue = 15;
		b.arrayValue = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
		b.currentSelected = @"b";
		b.stringValue = @"hello, world!";
		self.backend = b;
		[b release];
		[self setHasUndoManager:TRUE];
	}
	return self;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError { 
	BOOL result = FALSE;
	NSLog(@"type name: %@", typeName);
	if ([typeName isEqualToString:@"hl.spike.type"]) {
		Backend *b = [NSKeyedUnarchiver unarchiveObjectWithData:data];
		NSLog(@"%@", b);
		if (b) {
			result = TRUE;
			self.backend = b;
		}
	}
	return result;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
	NSLog(@"type name: %@", typeName);
	return [NSKeyedArchiver archivedDataWithRootObject:backend];
}

- (void)makeWindowControllers {
	FormWindowController *controller = [[FormWindowController alloc] initWithWindowNibName:@"Document"];
	[controller setShouldCloseDocument:TRUE];
	[self addWindowController:controller];
	NSLog(@"window's document: %@", [controller document]);
	NSLog(@"should cascade %d", [controller shouldCascadeWindows]);
	NSLog(@"should close %d", [controller shouldCloseDocument]);
	[controller release];
}

- (void) dealloc {
	[[self undoManager] release]; // clear the undo stack
	[backend release];
	[super dealloc];
}
@end
