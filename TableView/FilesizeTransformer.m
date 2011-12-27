#import "FilesizeTransformer.h"


@implementation FilesizeTransformer

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
	if (![value isKindOfClass:[NSNumber class]]) {
		[NSException raise: NSInternalInconsistencyException
                    format: @"Value (%@) is not number.",
		 [value class]];
	}
	double convertedValue = [value doubleValue];
	int multiplyFactor = 0;
	
	NSArray *tokens = [NSArray arrayWithObjects:@"bytes",@"KiB",@"MiB",@"GiB",@"TiB",nil];
	
	while (convertedValue > 1024) {
		convertedValue /= 1024;
		multiplyFactor++;
	}
	
	return [NSString stringWithFormat:@"%4.2f %@",convertedValue, [tokens objectAtIndex:multiplyFactor],value];
}


@end
