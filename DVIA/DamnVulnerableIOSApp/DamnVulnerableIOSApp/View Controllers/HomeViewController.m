//
//  HomeViewController.m
//  DamnVulnerableIOSApp
//
//  Created by Prateek Gianchandani on 12/30/13.
//  Copyright (c) 2013 HighAltitudeHacks.com. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+ECSlidingViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.slidingViewController.topViewController.view addGestureRecognizer:self.slidingViewController.panGesture];
    [DamnVulnerableAppUtilities addCommonBackgroundImageToViewController:self];
     self.navigationController.navigationBar.tintColor = kNavigationTintColor;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)projectHomePageTapped:(id)sender {
    [DamnVulnerableAppUtilities pushWebVCWithURL:kHomePage viewController:self];
}

- (IBAction)twitterHandleTapped:(id)sender {
    NSString *twitterHandle = [[((UIButton *)sender).titleLabel.text componentsSeparatedByString:@"@"] objectAtIndex:1];
    NSString *twitterHandleURL = [NSString stringWithFormat:@"twitter://%@",twitterHandle];
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:twitterHandleURL]]){
        NSURL *url = [NSURL URLWithString:twitterHandleURL];
        [[UIApplication sharedApplication] openURL:url];
    }
    else{
        [DamnVulnerableAppUtilities pushWebVCWithURL:twitterHandleURL viewController:self];
    }
}


@end
