#import "Company.h"


@implementation Company
@synthesize d;

- (id)initWithDepartment:(Department *)aDepartment {
	if (self = [super init]) {
		d = [aDepartment retain];
		[d addObserver:self forKeyPath:@"totalSalary" options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context:nil];
	}
	return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	NSLog(@"%@ chagned from %@ to %@", keyPath, [change objectForKey:NSKeyValueChangeOldKey], [change objectForKey:NSKeyValueChangeNewKey]);
}

- (void)dealloc {
	[d removeObserver:self forKeyPath:@"totalSalary"];
	[d release];
	[super dealloc];
}
@end
