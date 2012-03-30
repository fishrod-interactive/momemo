//
//  MMSecondViewController.m
//  momemo
//
//  Created by Gavin Williams on 30/03/2012.
//  Copyright (c) 2012 fishrod interactive. All rights reserved.
//

#import "MMSecondViewController.h"

@interface MMSecondViewController ()

@end

@implementation MMSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
	    return YES;
	}
}

@end
