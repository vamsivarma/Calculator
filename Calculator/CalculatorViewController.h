//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Vamsi Varma on 21/08/14.
//  Copyright (c) 2014 Divami Software Pvt Ltd. All rights reserved.
//Public API for the controller

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
//Display is the object for accessing content of the textfield on top of the calculator
@property (weak, nonatomic) IBOutlet UILabel *display;

@end
