//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Vamsi Varma on 21/08/14.
//  Copyright (c) 2014 Divami Software Pvt Ltd. All rights reserved.
//Public API for the model

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
//Declaration of the members of the interface
- (void)pushOperand: (double)operand;
- (double)performOperation:(NSString *)operation;

@property (readonly) id program;

//+ indicates the class method
+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram: (id)program;

@end
