//
//  POPViewController.m
//  POPAppRater
//
//  Created by popeveryday on 04/02/2016.
//  Copyright (c) 2016 popeveryday. All rights reserved.
//

#import "POPViewController.h"
#import <POPAppRater/POPAppRater.h>

@interface POPViewController ()<UIActionSheetDelegate>

@end

@implementation POPViewController
{
    UILabel* label;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.text = [NSString stringWithFormat:@"Total times app start: %d\n(Tap here to rate app)", [POPAppRater instance].counterTimes];
    label.numberOfLines = 100;
    label.userInteractionEnabled = YES;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionRate:)];
    [label addGestureRecognizer:tap];
    
}

-(void) actionRate:(id)sender
{
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"Actions" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Reset Counter" otherButtonTitles:@"Rate App", @"Show Rate Dialog", nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Reset Counter"])
    {
        [POPAppRater resetAll];
    }
    else if ([buttonTitle isEqualToString:@"Rate App"])
    {
        [POPAppRater rateAppID:@"896411278"];
    }
    else if ([buttonTitle isEqualToString:@"Show Rate Dialog"])
    {
        [POPAppRater showRaterWithAppID:@"896411278" appName:@"Message Backup Reader" maxCounterToAlert:[POPAppRater instance].counterTimes+1 maxCounterToReset:95];
    }
    
    label.text = [NSString stringWithFormat:@"Total times app start: %d\n(Tap here to rate app)", [POPAppRater instance].counterTimes];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
