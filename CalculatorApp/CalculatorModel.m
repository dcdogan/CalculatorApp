//
//  CalculatorModel.m
//  CalculatorApp
//
//  Created by DoganCan on 9/21/13.
//  Copyright (c) 2013 Dogan Can Dogan. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel{
    
    int index;

}

    
-(void) setOperand : (double)anOperand{
    
    operand = anOperand ;
}

- (void) performWaitingOperation {
       
    if ([@"+" isEqual: waitingOperation]) {
        operand = waitingOperand + operand ;
    }else if ([@"-" isEqual: waitingOperation]){
        operand = waitingOperand - operand ;
    }else if ([@"x" isEqual: waitingOperation]){
        operand = waitingOperand * operand ;
    }else if([@"/" isEqual: waitingOperation]){
        if(operand){
            operand = waitingOperand / operand ;
        }
    }


}

-(double) performOperation : (NSString *) operation {
        
    if ([ operation isEqual: @"√"]){
        
        operand = sqrt(operand);
    }
    else if ([ operation isEqual: @"sin"]){
        operand = sin(operand) ;
    }
    else if ([ operation isEqual: @"cos"]){
        operand = cos(operand) ;
    }
    else if ([ operation isEqual: @"MR"]){
        operand = memory ;
    }
    else if ([ operation isEqual: @"M+"]){
        memory += operand ;
    }
    else if ([ operation isEqual: @"M-"]){
        memory -= operand ;
    }
    else if ([ operation isEqual: @"MC"]){
        memory = 0 ;
    }
    else if ([ operation isEqual: @"CLEAR"]){
        waitingOperand = 0;
        operand = 0 ;
    }
       
    else {
        [self performWaitingOperation];
        waitingOperation = operation ;
        waitingOperand = operand ;
    }
    
    return operand;
    
}


-(NSString *) previousStep : (NSString *) myString {
    
    if ( [myString length] > 0)
        myString = [myString substringToIndex:[myString length] - 1];
    return myString ;
    
}

-(bool) isItANumber  {
    
    if(operand)
        return YES ;
    else {
        return NO;
    }
}


-(double) showMemory {
    
    return memory ;
    
}



@end
