//
//  DieLabel.h
//  Farkle
//
//  Created by Yash Varma on 1/15/14.
//  Copyright (c) 2014 Yash Varma - Fletcher Rhoads. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DieLabelDelegate.h"

@interface DieLabel : UILabel

@property id<DieLabelDelegate> delegate;

-(void)roll;

    


@end
