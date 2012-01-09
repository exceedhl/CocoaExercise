//
//  FormWindowController.m
//  Document
//
//  Created by huangliang on 1/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FormWindowController.h"


@implementation FormWindowController
- (void)windowDidLoad {
	[[self document] addObserver:self forKeyPath:@"backend.boolValue" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
	[[self document] addObserver:self forKeyPath:@"backend.minValue" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
	[[self document] addObserver:self forKeyPath:@"backend.maxValue" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
	[[self document] addObserver:self forKeyPath:@"backend.currentValue" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
	[[self document] addObserver:self forKeyPath:@"backend.arrayValue" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
	[[self document] addObserver:self forKeyPath:@"backend.currentSelected" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
	[[self document] addObserver:self forKeyPath:@"backend.stringValue" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
	[[self document] addObserver:self forKeyPath:@"backend.dateValue" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];	
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	NSLog(@"%@ changed from %@ to %@", keyPath, [change objectForKey:NSKeyValueChangeOldKey], [change objectForKey:NSKeyValueChangeNewKey]);
	[[[[self document] undoManager] prepareWithInvocationTarget:object] setValue:[change objectForKey:NSKeyValueChangeOldKey] forKeyPath:keyPath];
	[[self document] updateChangeCount:NSChangeDone];
}

- (void)dealloc {
	[[self document] removeObserver:self forKeyPath:@"backend.boolValue"];
	[[self document] removeObserver:self forKeyPath:@"backend.minValue"];
	[[self document] removeObserver:self forKeyPath:@"backend.maxValue"];
	[[self document] removeObserver:self forKeyPath:@"backend.currentValue"];
	[[self document] removeObserver:self forKeyPath:@"backend.arrayValue"];
	[[self document] removeObserver:self forKeyPath:@"backend.currentSelected"];
	[[self document] removeObserver:self forKeyPath:@"backend.stringValue"];
	[[self document] removeObserver:self forKeyPath:@"backend.dateValue"];
	[super dealloc];
}

@end
