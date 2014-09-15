//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Vamsi Varma on 21/08/14.
//  Copyright (c) 2014 Divami Software Pvt Ltd. All rights reserved.
//This is the model Object

#import "CalculatorBrain.h"

@interface CalculatorBrain()
//Place for declaring private variables
@property (nonatomic, strong) NSMutableArray *programStack;
@end

@implementation CalculatorBrain
//Synthesize never allocates memory
@synthesize programStack = _programStack;
//Getter for operand stack
//Overiding only the gette r
- (NSMutableArray *)programStack {
    //Lazy instantiation
    if (_programStack == nil)
        //Allocating space on heap
        _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}
- (void)pushOperand: (double)operand {
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}


//Version-1 of the code only remembers the operands in the stack but not the
//operations aka multiple operations get automatically popped out
- (double)performOperation:(NSString *)operation{
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}


- (id) program
{
    //Makes the copy of the internal state of programStack and
    //return a immutable array so that there is only
    //read-only access to the internal state
    return [self.programStack copy];
}

+ (NSString *)descriptionOfProgram:(id)program
{
    return @"Implement this in Assignment 2";
}

+ (double)popOperandOffStack:(NSMutableArray *)stack
{
    double result = 0;
    id topOfStack = [stack lastObject];
    //Eliminaion of removing from empty stack
    if(topOfStack) [stack removeLastObject];
    
    if([topOfStack isKindOfClass:[NSNumber class]]) {
        //If top of operand stack is number then
        //directly return the double equivalent of that number
        result = [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]]) {
        
        NSString *operation = topOfStack;
        
        //Applying recursion to continously extract the operands
        if([operation isEqualToString:@"+"]) {
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        } else if([@"*" isEqualToString:operation]) {
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
        } else if([@"-" isEqualToString:operation]) {
            double subtrahend = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] - subtrahend;
        } else if([@"/" isEqualToString:operation]) {
            double divisor = [self popOperandOffStack:stack];
            //Avoiding division by zero
            if(divisor) result = [self popOperandOffStack:stack] / divisor;
        }
    }
    
    //If stack is null we return 0
    
    return result;
    
}

+ (double) runProgram:(id)program
{
    //Local variables automatically start with initial value 0 in iOS5
    NSMutableArray *stack;
    //Introspection
    if([program isKindOfClass: [NSArray class]]) {
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}

@end