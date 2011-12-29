#import <Foundation/Foundation.h>
#import "Some.h"
#import "Other.h"
#import "Employee.h"
#import "Department.h"
#import "Company.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
	Some *some = [[Some alloc] init];
	Other *other = [[Other alloc] initWithSome:some];
	some.one = @"one's value";
	[some setOne:@"one's new value"];
	some.two = @"two's value";
	[some setTwo:@"tow's new value"];
	some.three = [NSArray arrayWithObjects:@"t.one", @"t.two", nil];
	NSLog(@"%@", [some dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"one", @"two", nil]]);
	[other release];
	[some release];
	
	Department *d = [[Department alloc] 
					 initWithEmployees:[NSArray arrayWithObjects:
										[Employee employeeWithSalary:1],
										[Employee employeeWithSalary:2],
										[Employee employeeWithSalary:3],
										nil]];	
	Company *c = [[Company alloc] initWithDepartment:d];
	[d release];
	[c.d.employees addObject:[Employee employeeWithSalary:4]];
	[[c mutableArrayValueForKeyPath:@"d.employees"] addObject:[Employee employeeWithSalary:5]]; 
	NSLog(@"%@", [c valueForKeyPath:@"d.employees.salary"]);
	[c release];
	
    [pool drain];
    return 0;
}
