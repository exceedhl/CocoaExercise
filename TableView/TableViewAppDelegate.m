//
//  TableViewAppDelegate.m
//  TableView
//
//  Created by huangliang on 12/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewAppDelegate.h"
#import "Files.h"
#import "File.h"
#import "DateTransformer.h"
#import "FilesizeTransformer.h"

@implementation TableViewAppDelegate

@synthesize window;
@synthesize arrayController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSArray *files = [Files getFilesInDir:@"/Users/huangliang/Desktop"];
	[arrayController addObjects:files];
	
	DateTransformer *dateTransformer = [[[DateTransformer alloc] init] autorelease];
	[NSValueTransformer setValueTransformer:dateTransformer forName:@"DateTransformer"];
	FilesizeTransformer *filesizeTransformer = [[[FilesizeTransformer alloc] init] autorelease];
	[NSValueTransformer setValueTransformer:filesizeTransformer forName:@"FilesizeTransformer"];

}

@end
