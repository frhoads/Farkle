//
//  DieLabel.m
//  Farkle
//
//  Created by Yash Varma on 1/15/14.
//  Copyright (c) 2014 Yash Varma - Fletcher Rhoads. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

@synthesize delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(IBAction)labelWasTapped:(id)sender
{
    //Don't need _delegate since we @synthesize(d) delegate
    [delegate didChooseDie:self];
    
}
-(void)roll
{
    int rollForRandom = (arc4random() % 6) + 1;
    self.text = [NSString stringWithFormat:@"%i", rollForRandom];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
