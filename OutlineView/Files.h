#import <Cocoa/Cocoa.h>


@interface Files : NSObject {
	NSURL *rootDir;
	NSArray *children;
}

- (id)initWithDir:(NSURL *)dir;
- (NSArray *)children;
- (BOOL)isLeaf;
- (int) count;

- (NSString *)filename;
@end
