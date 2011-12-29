#import <Cocoa/Cocoa.h>

@class Department;
@interface Company : NSObject {
	Department *d;
}

@property (retain) Department *d;

- (id)initWithDepartment:(Department *)aDepartment;

@end
