#import "Files.h"
#import "File.h"

@implementation Files
+ (NSArray *)getFilesInDir:(NSString *)dir {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *keys = [NSArray arrayWithObject:NSURLLocalizedTypeDescriptionKey];
	NSArray *urls = [fileManager contentsOfDirectoryAtURL:[NSURL fileURLWithPath:dir] 
							   	includingPropertiesForKeys:keys 
								options:NSDirectoryEnumerationSkipsHiddenFiles 
								error:nil];
	NSMutableArray *files = [NSMutableArray array];
	for (NSURL *url in urls) {
		File *file = [[File alloc] initWithURL:url];
		[files addObject: file];
		[file release];
	}
	return files;
}
@end
