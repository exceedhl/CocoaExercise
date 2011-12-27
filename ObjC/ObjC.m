#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
	id isLeaf;
	[[NSURL fileURLWithPath:@"/Users"] getResourceValue:&isLeaf forKey:NSURLIsDirectoryKey error:nil];
	NSLog(@"%@", ![isLeaf boolValue]);
	
	for (NSString *key in [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]) {
		NSLog(@"%@", key);
	}
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSLog(@"%@", [defaults objectForKey:@"NSLanguages"]);
	
	[defaults setDouble:3.10 forKey:@"test.key"];
	
	NSLog(@"%@", [defaults objectForKey:@"test.key"]);
	
	
	
    NSLog(@"Hello, World!");
    [pool drain];
    return 0;
}
