//
//  UIButton+AGi18n.m
//  AGi18n
//
//  Created by Angel Garcia on 3/13/13.
//  Copyright (c) 2013 angelolloqui.com. All rights reserved.
//

#import "UIButton+AGi18n.h"

@implementation UIButton (AGi18n)

- (void)localizeFromNib {

    //Replace text with localizable version
    //and preserve the states without title or localize a state twice
	NSString *normalTitle = [self titleForState:UIControlStateNormal];
	if (normalTitle.length > 0)
	{
		[self setTitle:[[NSBundle mainBundle] localizedStringForKey:normalTitle value:@"" table:nil] forState:UIControlStateNormal];
	}

    NSArray *states = @[@(UIControlStateHighlighted), @(UIControlStateDisabled), @(UIControlStateSelected), @(UIControlStateApplication)];
    for (NSNumber *state in states)
	{
        NSString *title = [self titleForState:state.integerValue];
        if (title.length > 0)
		{
			NSString *tempTitle = [[NSBundle mainBundle] localizedStringForKey:title value:@"" table:nil];
			if(![tempTitle isEqualToString:[self titleForState:state.integerValue]])
			{
				[self setTitle:[[NSBundle mainBundle] localizedStringForKey:title value:@"" table:nil] forState:state.integerValue];
			}
        }
    }

}

@end
