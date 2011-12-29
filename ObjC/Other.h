#import <Cocoa/Cocoa.h>

@class Some;

@interface Other : NSObject {
	Some *some;
}

- (id)initWithSome:(Some *)some;

@end
