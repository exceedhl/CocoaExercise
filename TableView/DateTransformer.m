#import "DateTransformer.h"


@implementation DateTransformer
+ (Class)transformedValueClass
{
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value
{
	if (value == nil) return nil;
	if (![value isKindOfClass:[NSDate class]]) {
		[NSException raise: NSInternalInconsistencyException
                    format: @"Value (%@) is not NSDate.",
		 [value class]];
	}
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
		
	return [dateFormatter stringFromDate:value];
}
@end
