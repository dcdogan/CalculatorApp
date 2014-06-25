//
//  CalculatorModel.h
//  CalculatorApp
//
//  Created by DoganCan on 9/21/13.
//  Copyright (c) 2013 Dogan Can Dogan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject{
    
    double operand;
    double memory;
    NSString *waitingOperation ;
    double waitingOperand ;

}

-(void) setOperand : (double)anOperand;
-(double) performOperation : (NSString *) operation ;
-(NSString *) previousStep : (NSString *) myString ;
-(bool) isItANumber ;
-(double) showMemory ;


@end
