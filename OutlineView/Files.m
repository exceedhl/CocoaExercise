#import "Files.h"

@implementation Files

- (id)initWithDir:(NSURL *)dir {
	if (self = [super init]) {
		rootDir = [dir retain];
	}
	return self;
}

- (NSArray *)children {
	if ([self isLeaf]) return children;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *keys = [NSArray arrayWithObjects:NSURLLocalizedTypeDescriptionKey, NSURLIsDirectoryKey, nil];
	NSArray *urls = [fileManager contentsOfDirectoryAtURL:rootDir
							   includingPropertiesForKeys:keys 
												  options:NSDirectoryEnumerationSkipsHiddenFiles 
													error:nil];
	NSMutableArray *files = [NSMutableArray array];
	for (NSURL *url in urls) {
		Files *file = [[Files alloc] initWithDir:url];
		[files addObject: file];
		[file release];
	}
	children = files;
	return children;	
}

- (BOOL)isLeaf {
	NSDictionary *attr = [[NSFileManager defaultManager] attributesOfItemAtPath:[rootDir path] error:nil];
	if ([attr objectForKey:NSFileType] == NSFileTypeDirectory) {
		return FALSE;
	}
	return TRUE;
}

- (int) count {
	return [children count];	
}

- (NSString *)filename {
	return [rootDir lastPathComponent];
}

- (void)dealloc {
	[rootDir release];
	[super dealloc];
}
@end
