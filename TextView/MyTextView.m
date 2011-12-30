#import "MyTextView.h"
#import "TextViewAppDelegate.h"

@implementation MyTextView
- (void)mouseDown:(NSEvent *)theEvent {
	NSLog(@"mouse clicked on textview");
	TextViewAppDelegate *d = (TextViewAppDelegate *)[[NSApplication sharedApplication] delegate];
	[d setValue:self forKey:@"textView"];
	[self setDelegate:d];
	NSLog(@"textview in app delegate: %@", [d textView]);
	[super mouseDown:theEvent];
}
@end
