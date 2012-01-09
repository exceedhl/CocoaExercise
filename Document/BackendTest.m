#import <GHUnit/GHUnit.h> 
#import "Backend.h"

@interface BackendTest : GHTestCase { }
@end

@implementation BackendTest

- (void)testArchiveAndUnarchive {       
	Backend *backend = [[Backend alloc] init];
	backend.boolValue = FALSE;
	backend.minValue = 2;
	backend.maxValue = 10;
	backend.currentValue = 8;
	backend.dateValue = [NSDate date];
	backend.arrayValue = [NSArray arrayWithObjects:@"a", @"b", nil];
	backend.currentSelected = @"a";
	backend.stringValue = @"text...";
	NSData *archive = [NSKeyedArchiver archivedDataWithRootObject:backend];
	Backend *restoredBackend = [NSKeyedUnarchiver unarchiveObjectWithData:archive];
	GHAssertEquals(backend.boolValue, restoredBackend.boolValue, nil);
	GHAssertEquals(backend.minValue, restoredBackend.minValue, nil);
	GHAssertEquals(backend.maxValue, restoredBackend.maxValue, nil);
	GHAssertEquals(backend.currentValue, restoredBackend.currentValue, nil);
	GHAssertEqualObjects(backend.dateValue, restoredBackend.dateValue, nil);
	GHAssertEqualObjects(backend.arrayValue, restoredBackend.arrayValue, nil);
	GHAssertEqualObjects(backend.currentSelected, restoredBackend.currentSelected, nil);
	GHAssertEqualObjects(backend.stringValue, restoredBackend.stringValue, nil);
	[backend release];
}

@end