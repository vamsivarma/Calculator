//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Vamsi Varma on 21/08/14.
//  Copyright (c) 2014 Divami Software Pvt Ltd. All rights reserved.
//Variables declared in .h file are the public variables
//Variables declared in .m are private variables

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
//Place for private variables
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation CalculatorViewController

@synthesize display =  _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

//Lazy instantiation of Brain class(model) object
- (CalculatorBrain *)brain {
    if(!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if(self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text =  [self.display.text  stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}
- (IBAction)operationPressed:(UIButton *)sender {
    //Explicitly pre ssing enter when a operation or calculation is made
    if(self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

@end
