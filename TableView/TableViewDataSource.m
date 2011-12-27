#import "TableViewDataSource.h"
#import "Files.h"
#import "File.h"

@implementation TableViewDataSource

- (void)awakeFromNib {
	files = [[Files getFilesInDir:@"/Users/huangliang/Desktop"] retain];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
	return [files count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex {
	File *file = [files objectAtIndex:rowIndex];
	return [file performSelector:NSSelectorFromString([aTableColumn identifier])];
}

- (void)dealloc {
	[files release];
	[super dealloc];
}
@end
