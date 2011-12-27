#import "TableViewDelegate.h"


@implementation TableViewDelegate
- (void)tableView:(NSTableView *)tableView didClickTableColumn:(NSTableColumn *)tableColumn {
	NSLog(@"clicked table colomn : %@", [tableColumn identifier]);
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
	NSTableView *t = [aNotification object];
	NSLog(@"selected row: %d", [t selectedRow]);
}
@end
