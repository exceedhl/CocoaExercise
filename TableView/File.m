#import "File.h"


@implementation File

- (id)initWithURL:(NSURL *)aURL {
	if (self = [super init]) {
		url = [aURL retain];
	}
	return self;
}

- (NSDictionary *)attributes {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (!attributes) {
		attributes = [[fileManager attributesOfItemAtPath:[url path] error:nil] retain];
	}
	return attributes;
}

- (NSString *)filename {
	return [url lastPathComponent];
}

- (NSString *)filetype {
	NSString *type;
	[url getResourceValue:&type forKey:NSURLLocalizedTypeDescriptionKey error:nil];
	return type;
}

- (NSNumber *)filesize {
	return [[self attributes] objectForKey:NSFileSize];	
}

- (NSDate *)creationDate {
	return [[self attributes] objectForKey:NSFileCreationDate];
}

- (NSDateComponents *)modificationDate {
	return [[self attributes] objectForKey:NSFileModificationDate];
}

- (void)dealloc {
	[url release];
	[attributes release];
	[super dealloc];
}

@end
