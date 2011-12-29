#import <Cocoa/Cocoa.h>

@class Employee;
@interface Department : NSObject {
	NSMutableArray *employees;
	int totalSalary;
}

@property (retain) NSMutableArray *employees;

- (id)initWithEmployees:(NSArray *)theEmployees;
- (int)totalSalary;
- (void)setTotalSalary:(int)theTotalSalary;
@end
