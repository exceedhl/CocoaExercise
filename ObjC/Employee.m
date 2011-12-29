#import "Employee.h"


@implementation Employee
@synthesize salary;

+ (id)employeeWithSalary:(int)s {
	Employee *e = [[Employee alloc] init];
	e.salary = [[NSNumber numberWithInt:s] retain];
	return [e autorelease];
}

- (void)dealloc {
	[salary release];
	[super dealloc];
}

@end
