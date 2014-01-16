//
//  ViewController.m
//  Farkle
//
//  Created by Yash Varma on 1/15/14.
//  Copyright (c) 2014 Yash Varma - Fletcher Rhoads. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"


@interface ViewController () <DieLabelDelegate>
{
    __weak IBOutlet DieLabel *dieLabel1;
    __weak IBOutlet DieLabel *dieLabel2;
    __weak IBOutlet DieLabel *dieLabel3;
    __weak IBOutlet DieLabel *dieLabel4;
    __weak IBOutlet DieLabel *dieLabel5;
    __weak IBOutlet DieLabel *dieLabel6;
    NSMutableArray *dice;
    NSArray *labels;
    int score;
    int tScore;
    int tCounter;
    __weak IBOutlet UILabel *userScore;
    __weak IBOutlet UILabel *totalScore;
    __weak IBOutlet UILabel *totalScoreLabel;
    __weak IBOutlet UILabel *bankableScoreLabel;
    __weak IBOutlet UIButton *bankButton;
    __weak IBOutlet UIButton *rollButton;
    __weak IBOutlet UILabel *gameOverLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dice = [NSMutableArray array];
    labels = [NSArray arrayWithObjects: dieLabel1, dieLabel2, dieLabel3, dieLabel4,dieLabel5, dieLabel6, nil];
    
    dieLabel1.delegate = self;
    dieLabel2.delegate = self;
    dieLabel3.delegate = self;
    dieLabel4.delegate = self;
    dieLabel5.delegate = self;
    dieLabel6.delegate = self;

}

- (IBAction)onRollButtonPressed:(id)sender
{
    if ([dice containsObject:dieLabel1] == NO) {
        [dieLabel1 roll];
    }
    
    if ([dice containsObject:dieLabel2] == NO) {
        [dieLabel2 roll];
    }
    
    if ([dice containsObject:dieLabel3] == NO) {
        [dieLabel3 roll];
    }
    
    if ([dice containsObject:dieLabel4] == NO) {
        [dieLabel4 roll];
    }
    
    if ([dice containsObject:dieLabel5] == NO) {
        [dieLabel5 roll];
    }
    
    if ([dice containsObject:dieLabel6] == NO) {
        [dieLabel6 roll];
    }
}

-(void)didChooseDie:(DieLabel *)dieLabel
{
    
    
    if ([dice containsObject:dieLabel] == NO) {
        [dice addObject:dieLabel];
        dieLabel.backgroundColor = [UIColor redColor];
    } else if ([dice containsObject:dieLabel] == YES){
        [dice removeObject:dieLabel];
        dieLabel.backgroundColor = [UIColor greenColor];
    }
    
    score = 0;
    int oneCounter = 0;
    int twoCounter = 0;
    int threeCounter = 0;
    int fourCounter = 0;
    int fiveCounter = 0;
    int sixCounter = 0;
    
    for (int i = 0; i < dice.count; i++) {
        DieLabel *countString = [dice objectAtIndex:i];
        int count = [countString.text intValue];
        if (count == 1)
            oneCounter ++;
        if (count == 2)
            twoCounter ++;
        if (count == 3)
            threeCounter ++;
        if (count == 4)
            fourCounter ++;
        if (count == 5)
            fiveCounter ++;
        if (count == 6)
            sixCounter ++;
        }
    
    NSLog(@"one is %i, two is %i, three is %i, four is %i, five is %i, six is %i", oneCounter, twoCounter
          , threeCounter, fourCounter, fiveCounter, sixCounter);
    
    
    if (oneCounter == 1) {
        score += 100;
    } else if (oneCounter == 2) {
        score += 200;
    } else if (oneCounter == 3) {
        score += 1000;
    } else if (oneCounter == 4) {
        score += 1100;
    } else if (oneCounter == 5) {
        score += 1200;
    } else if (oneCounter == 6) {
        score += 2000;
    }
    
    if (twoCounter == 3) {
        score += 200;
    } else if (twoCounter == 6) {
        score += 400;
    }
    
    if (threeCounter == 3) {
        score += 300;
    } else if (threeCounter == 6) {
        score += 600;
    }
    
    if (fourCounter == 3) {
        score += 400;
    } else if (fourCounter == 6) {
        score += 800;
    }
    
    if (fiveCounter == 1) {
        score += 50;
    } else if (fiveCounter == 2) {
        score += 100;
    } else if (fiveCounter == 3) {
        score += 150;
    } else if (fiveCounter == 4) {
        score += 200;
    } else if (fiveCounter == 5) {
        score += 500;
    } else if (fiveCounter == 6) {
        score += 550;
    }
    
    
    if (sixCounter == 3) {
        score += 600;
    } else if (sixCounter == 6) {
        score += 1200;
    }
    userScore.text = [NSString stringWithFormat:@"%i", score];
    
}



- (IBAction)onBankButtonPressed:(id)sender
{
    tCounter += 0;
    tScore += score;
    totalScore.text = [NSString stringWithFormat:@"%i",tScore];
    
    userScore.text = @"0";
    
    for (int i = 0; i < labels.count; i++) {
        DieLabel *label = [labels objectAtIndex:i];
        label.backgroundColor = [UIColor greenColor];
        label.text = @":)";
    }
    
    tCounter ++;
    if (tCounter > 0) {
        userScore.alpha = 0;
        bankableScoreLabel.alpha = 0;
        bankButton.alpha = 0;
        rollButton.alpha = 0;
        gameOverLabel.alpha = 1;
        gameOverLabel.textAlignment = NSTextAlignmentCenter;
        gameOverLabel.text = @"Game Over, Fark this Game";
        gameOverLabel.font = [gameOverLabel.font fontWithSize:(30)];
        gameOverLabel.shadowColor = [UIColor whiteColor];
        gameOverLabel.shadowOffset = CGSizeMake(-3.0f, 2.0f);
        for (int i = 0; i < labels.count; i++) {
            DieLabel *label = [labels objectAtIndex:i];
            label.alpha = 0;
        }
    }
    NSLog(@"counter is %i", tCounter);
    [dice removeAllObjects];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
