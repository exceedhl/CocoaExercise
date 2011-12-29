#import "Other.h"


@implementation Other
- (id)initWithSome:(Some *)aSome {
	if (self = [super init]) {
		some = [aSome retain];
		[some addObserver:self
				  forKeyPath:@"one" 
				  options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) 
				  context:NULL];
		[some addObserver:self forKeyPath:@"two" 
				  options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) 
				  context:NULL];
		[some addObserver:self forKeyPath:@"three" 
				  options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) 
				  context:NULL];
	}
	return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	NSLog(@"%@ chagned from %@ to %@", keyPath, [change objectForKey:NSKeyValueChangeOldKey], [change objectForKey:NSKeyValueChangeNewKey]);
}

- (void)dealloc {
	[some removeObserver:self forKeyPath:@"one"];
	[some removeObserver:self forKeyPath:@"two"];
	[some removeObserver:self forKeyPath:@"three"];
	[some release];
	[super dealloc];
}
@end
