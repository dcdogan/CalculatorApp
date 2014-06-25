//
//  CalculatorViewController.h
//  CalculatorApp
//
//  Created by DoganCan on 9/17/13.
//  Copyright (c) 2013 Dogan Can Dogan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorModel.h"

#define operationTypeString(enum) [@[@"+",@"-",@"x",@"/"] objectAtIndex:enum]


@interface CalculatorViewController : UIViewController{
    
    CalculatorModel *model;
    
    BOOL isUserInTheMiddleOfTypingANumber;
}

@property (strong, nonatomic) IBOutlet UILabel *displaySummary;
@property (strong, nonatomic) IBOutlet UILabel *displayResult;

@property (strong, nonatomic) IBOutlet UILabel *displayMemory;

- (IBAction) operationPressed :(UIButton  *) sender;

- (IBAction) digitPressed :(UIButton *) sender ;

- (IBAction)clearPressed:(id)sender;

- (IBAction)goBack:(id)sender;
- (IBAction)totalPressed:(id)sender;

- (IBAction)showMemory:(id)sender;
@end
