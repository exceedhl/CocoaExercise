#import <Cocoa/Cocoa.h>


@interface TableViewDataSource : NSObject<NSTableViewDataSource, NSTableViewDelegate> {
	NSArray *files;
}

@end
