#import "Some.h"


@implementation Some

@synthesize one;

- (NSString *)two {
	return two;
}
- (void)setTwo:(NSString *)value {
	if (value != two) {
		[two release];
		two = [value retain];
	}
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey {
	BOOL automatic = NO;
	if (![theKey isEqual:@"three"]) {
		automatic = [super automaticallyNotifiesObserversForKey:theKey];
	}
	return automatic;
}

- (NSArray *)three {
	return [NSArray arrayWithObjects:one, two, nil];
}
- (void) setThree:(NSArray *)newThree {
	if (newThree != three) {
		[self willChangeValueForKey:@"three"];
		one = [newThree objectAtIndex:0];
		two = [newThree objectAtIndex:1];
		[self didChangeValueForKey:@"three"];
	}
}

+ (NSSet *)keyPathsForValuesAffectingThree {
	return [NSSet setWithObjects:@"one", @"two", nil];
}


-(void)dealloc {
	[one release];
	[two release];
	[super dealloc];
}

@end
