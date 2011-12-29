#import <Cocoa/Cocoa.h>


@interface Employee : NSObject {
	NSNumber *salary;
}

@property (retain) NSNumber *salary;

+ (id)employeeWithSalary:(int)s;

@end
