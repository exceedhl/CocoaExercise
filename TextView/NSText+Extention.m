#import "NSText+Extention.h"


@implementation NSText (Extention)
- (IBAction)alignLeftAndSetAlignment:(id)sender {
	[self alignLeft:sender];
	[self setAlignment:NSLeftTextAlignment];
}
- (IBAction)alignRightAndSetAlignment:(id)sender {
	[self alignRight:sender];
	[self setAlignment:NSRightTextAlignment];
}
- (IBAction)alignCenterAndSetAlignment:(id)sender {
	[self alignCenter:sender];
	[self setAlignment:NSCenterTextAlignment];
}
- (IBAction)alignJustifiedAndSetAlignment:(id)sender {
	[self alignJustified:sender];
	[self setAlignment:NSJustifiedTextAlignment];	
}
@end
