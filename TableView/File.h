#import <Cocoa/Cocoa.h>


@interface File : NSObject {
	NSURL *url;
	NSDictionary *attributes;
}

- (id)initWithURL:(NSURL *)aURL;
- (NSDictionary *)attributes;
- (NSString *)filename;
- (NSString *)filetype;
- (NSNumber *)filesize;
- (NSDate *)creationDate;
- (NSDateComponents *)modificationDate;

@end
