//
//  CalculatorViewController.m
//  CalculatorApp
//
//  Created by DoganCan on 9/17/13.
//  Copyright (c) 2013 Dogan Can Dogan. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController{
    
    NSString * digit;
    NSString * operation;
    NSString * sum;
    int newNumber;
}

@synthesize displayMemory = _displayMemory;
@synthesize displayResult = _displayResult;
@synthesize displaySummary = _displaySummary;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Initialize the calculator model

- (CalculatorModel *) model{
    
    if(!model){
        model = [[CalculatorModel alloc] init];
    }
    
    return model;
}

// Implementation of digits
// If user already entered a number just append that digit
// Else set the FLAG (isUserInTheMiddleOfTypingANumber) to YES
// APPEND to summary and JUST DISPLAY in the result label

- (IBAction) digitPressed :(UIButton *) sender {

    digit = [[sender titleLabel] text] ;

    if(isUserInTheMiddleOfTypingANumber){
        
        [_displayResult setText: [[_displayResult text] stringByAppendingString : digit ]];
        [_displaySummary setText: [[_displaySummary text] stringByAppendingString : digit ]];
    }
    
    else{
        
        [_displayResult setText:digit];
        [_displaySummary setText: [[_displaySummary text] stringByAppendingString : digit ]];
        isUserInTheMiddleOfTypingANumber = YES ;
    }
    
}

- (IBAction)clearPressed:(id)sender {
    [_displaySummary setText:@""];
    
}

- (IBAction)goBack:(id)sender {
    
    sum = [_displaySummary text] ;
    
    [_displaySummary setText:[[self model] previousStep : sum]];
    
    newNumber = [_displayResult.text intValue]/10 ;
    if(newNumber){
        [_displayResult setText:[NSString stringWithFormat : @"%i", newNumber ] ];
    }
    else{
        [_displayResult setText:@""];
        isUserInTheMiddleOfTypingANumber = NO;
    }

    
}

- (IBAction)totalPressed:(id)sender {
    isUserInTheMiddleOfTypingANumber = NO;
}

// Implement the operation
// First set the entered number (operand)
// Check whether it should go to summary or not
// Then call the performOperation function with the input operation 

- (IBAction) operationPressed :(UIButton  *) sender{

    if(isUserInTheMiddleOfTypingANumber){
        [[self model] setOperand : [[_displayResult text] doubleValue]];
        isUserInTheMiddleOfTypingANumber = NO;
    }
    
    if((![sender.currentTitle isEqualToString:@"="]) && (![sender.currentTitle isEqualToString:@"CLEAR"]) && (![sender.currentTitle isEqualToString:@"M+"]) && (![sender.currentTitle isEqualToString:@"MR"]) && (![sender.currentTitle isEqualToString:@"M-"])  && (![sender.currentTitle isEqualToString:@"MC"])){
        [_displaySummary setText: [[_displaySummary text] stringByAppendingString : sender.currentTitle ]];
    }
    
    
    operation = [[sender titleLabel ] text ];
    double result = [[self model] performOperation: operation] ;
    [_displayResult setText:[NSString stringWithFormat : @"%g", result ] ];


}

- (IBAction)showMemory:(id)sender{
    
    double memory = [[self model] showMemory];
    
    [_displayMemory setText:[NSString stringWithFormat:@"%g", memory]];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
