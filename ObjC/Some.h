#import <Cocoa/Cocoa.h>


@interface Some : NSObject {
	NSString *one;
	NSString *two;
	NSArray *three;
}

@property (retain) NSString *one;
- (NSString *)two;
- (void)setTwo:(NSString *)value;

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)theKey;

- (NSArray *)three;
- (void) setThree:(NSArray *)newThree;
@end
