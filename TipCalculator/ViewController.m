//
//  ViewController.m
//  TipCalculator
//
//  Created by Nathan Wainwright on 2018-08-10.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;

@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;

@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;

@property (weak, nonatomic) IBOutlet UIButton *calculateTipAmountPressed;

- (IBAction) calculateTipPercentage:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction) calculateTipPercentage:(id)sender{
    // create NumberFormatter to format variables as floats and to handle decimal places
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    numberFormatter.locale = [NSLocale currentLocale];// this ensures the right separator behavior (ie, current style for location)
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    [numberFormatter setMaximumFractionDigits:2]; // sets max number of decimal places to two, kinda needed for dollars
    numberFormatter.usesGroupingSeparator = YES;
    NSDecimalNumber *billAmount = [[NSDecimalNumber alloc] initWithString:self.billAmountTextField.text]; // converts amount from slider into working float number
    
    NSDecimalNumber *tipPercentage = [[NSDecimalNumber alloc] initWithString:self.tipPercentageTextField.text]; // converts text (number) from field into working float number
    NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithInt:10]; // so that I can convert 15 into "0.15" for percentage.
    tipPercentage = [tipPercentage decimalNumberByDividingBy:decimalNumber];
    NSDecimalNumber *totalBill = [billAmount decimalNumberByMultiplyingBy:tipPercentage]; // calculation to split amounts.
    self.tipAmountLabel.text = [NSString stringWithFormat:@"%@", [numberFormatter stringForObjectValue:totalBill]]; // returns value to text field.
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
