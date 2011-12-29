//
//  TextViewAppDelegate.m
//  TextView
//
//  Created by huangliang on 12/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextViewAppDelegate.h"

@interface TextViewAppDelegate (PrivateCategory)

- (id)getCurrentAttribute:(NSString *)attributeName;
- (void)setAttribute:(NSString *)name value:(id)value;
- (NSFont *)font;
- (void)setFont:(NSFont *)font;

@end


@implementation TextViewAppDelegate

@synthesize window;
@synthesize textView;
@synthesize panel;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[panel setBecomesKeyOnlyIfNeeded:TRUE];
	
	[self setFont:[NSFont fontWithName:@"Helvetica" size:14]];
	NSLog(@"%@", [textView typingAttributes]);
}

- (NSRange)textView:(NSTextView *)aTextView willChangeSelectionFromCharacterRange:(NSRange)oldSelectedCharRange toCharacterRange:(NSRange)newSelectedCharRange {
	[self willChangeValueForKey:@"fontName"];
	[self willChangeValueForKey:@"fontSize"];
	[self willChangeValueForKey:@"underline"];
	[self willChangeValueForKey:@"bold"];
	[self willChangeValueForKey:@"italic"];
	[self willChangeValueForKey:@"foregroundColor"];
	[self willChangeValueForKey:@"backgroundColor"];
	return newSelectedCharRange;
}

- (void)textViewDidChangeSelection:(NSNotification *)aNotification {
	[self didChangeValueForKey:@"fontName"];
	[self didChangeValueForKey:@"fontSize"];
	[self didChangeValueForKey:@"underline"];
	[self didChangeValueForKey:@"bold"];
	[self didChangeValueForKey:@"italic"];
	[self didChangeValueForKey:@"foregroundColor"];
	[self didChangeValueForKey:@"backgroundColor"];
}

- (NSNumber *)alignment {
	NSDictionary *attr;
	NSValue *r = (NSValue *)[[textView selectedRanges] objectAtIndex:0];
	if ([r rangeValue].length > 0) {
		NSRange rr;
		attr = [[textView textStorage] attributesAtIndex:[r rangeValue].location effectiveRange:&rr];
	} else {
		attr = [textView typingAttributes];
	}
	NSParagraphStyle *style = (NSParagraphStyle *)[attr objectForKey:NSParagraphStyleAttributeName];
	return [NSNumber numberWithInt:[style alignment]];
}

- (void)setAlignment:(NSNumber *)alignment {
	switch ([alignment intValue]) {
		case NSLeftTextAlignment:
			[textView alignLeft:nil];
			break;
		case NSRightTextAlignment:
			[textView alignRight:nil];
			break;
		case NSCenterTextAlignment:
			[textView alignCenter:nil];
			break;			
		case NSJustifiedTextAlignment:
			[textView alignJustified:nil];
			break;			
		default:
			break;
	}
}

- (NSString *)fontName {
	NSFont *font = [self font];
	return [font familyName];
}

- (void)setFontName:(NSString *)fontName {
	NSFont *font = [[NSFontManager sharedFontManager] convertFont:[self font] toFamily:fontName];
	[self setAttribute:NSFontAttributeName value:font];
}

- (NSNumber *)fontSize {
	NSFont *font = [self font];
	return [NSNumber numberWithFloat:[font pointSize]];
}

- (void)setFontSize:(NSNumber *)size {
	NSFont *font = [[NSFontManager sharedFontManager] convertFont:[self font] toSize:[size floatValue]];
	[self setAttribute:NSFontAttributeName value:font];	
}

- (NSUInteger)underline {
	return [[self getCurrentAttribute:NSUnderlineStyleAttributeName] intValue];
}

- (void)setUnderline:(NSUInteger)state {
	[self setAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:state]];	
}

- (NSUInteger)bold {
	NSFont *font = [self font];
	NSUInteger traits = [[NSFontManager sharedFontManager] traitsOfFont:font];
	NSUInteger result = (traits & NSBoldFontMask) > 0 ? 1 : 0;
	return result;
}

- (void)setBold:(NSUInteger)state {
	NSFont *font;
	if (state > 0) {
		font = [[NSFontManager sharedFontManager] convertFont:[self font] toHaveTrait:NSBoldFontMask];
	}
	else {
		font = [[NSFontManager sharedFontManager] convertFont:[self font] toNotHaveTrait:NSBoldFontMask];
	}
	[self setAttribute:NSFontAttributeName value:font];	
}

- (NSUInteger)italic {
	NSFont *font = [self font];
	NSUInteger traits = [[NSFontManager sharedFontManager] traitsOfFont:font];
	NSUInteger result = (traits & NSItalicFontMask) > 0 ? 1 : 0;
	return result;
}

- (void)setItalic:(NSUInteger)state {
	NSFont *font;
	if (state > 0) {
		font = [[NSFontManager sharedFontManager] convertFont:[self font] toHaveTrait:NSItalicFontMask];
	}
	else {
		font = [[NSFontManager sharedFontManager] convertFont:[self font] toNotHaveTrait:NSItalicFontMask];
	}
	[self setAttribute:NSFontAttributeName value:font];	
}

- (NSFont *)font {
	return [self getCurrentAttribute:NSFontAttributeName];
}

- (void)setFont:(NSFont *)font {
	[self willChangeValueForKey:@"fontName"];
	[self willChangeValueForKey:@"fontSize"];
	[self willChangeValueForKey:@"bold"];
	[self willChangeValueForKey:@"italic"];
	[self setAttribute:NSFontAttributeName value:font];	
	[self didChangeValueForKey:@"fontName"];
	[self didChangeValueForKey:@"fontSize"];
	[self didChangeValueForKey:@"bold"];
	[self didChangeValueForKey:@"italic"];
}

- (NSColor *)foregroundColor {
	return [self getCurrentAttribute:NSForegroundColorAttributeName];
}

- (void)setForegroundColor:(NSColor *)color {
	[self setAttribute:NSForegroundColorAttributeName value:color];
}

- (NSColor *)backgroundColor {
	return [self getCurrentAttribute:NSBackgroundColorAttributeName];
}

- (void)setBackgroundColor:(NSColor *)color {
	[self setAttribute:NSBackgroundColorAttributeName value:color];
}

- (id)getCurrentAttribute:(NSString *)attributeName {
	NSDictionary *attr;
	NSValue *r = (NSValue *)[[textView selectedRanges] objectAtIndex:0];
	if ([r rangeValue].length > 0) {
		NSRange rr;
		attr = [[textView textStorage] attributesAtIndex:[r rangeValue].location effectiveRange:&rr];
	} else {
		attr = [textView typingAttributes];
	}
	return [attr objectForKey:attributeName];		
}

- (void)setAttribute:(NSString *)name value:(id)value {
	NSValue *r = (NSValue *)[[textView selectedRanges] objectAtIndex:0];
	if ([r rangeValue].length > 0) {
		[[textView textStorage] addAttribute:name value:value range:[r rangeValue]];
	} else {
		NSMutableDictionary *newAttr = [NSMutableDictionary dictionaryWithDictionary:[textView typingAttributes]];
		[newAttr setObject:value forKey:name];
		[textView setTypingAttributes:newAttr];
	}	
}

@end
