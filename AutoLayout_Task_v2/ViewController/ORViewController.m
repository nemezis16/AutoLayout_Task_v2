//
//  ORViewController.m
//  AutoLayout_Task_v2
//
//  Created by MacBook on 25.10.15.
//  Copyright (c) 2015 Osadchuk. All rights reserved.
//

#import "ORViewController.h"

@interface ORViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;
@property (weak, nonatomic) IBOutlet UIButton *buttonLoad;

@end

@implementation ORViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view removeConstraints:self.view.constraints];
    
    //add constraints to label
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:25]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-25]];
    
     [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:30]];
    
     [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-100]];
    
    
    //add constrains to Clear button
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonClear attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:10]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonClear attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-10]];
    
    
    //add constrains to Load button
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonLoad attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-10]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.buttonLoad attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-10]];
    
}

- (IBAction)loadText:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSMacOSRomanStringEncoding error:nil];
    
    self.textLabel.numberOfLines=0;
    
    
    //set justified alignment
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentJustified;
    
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName : paragraph,
                                  NSFontAttributeName : self.textLabel.font,
                                  NSUnderlineStyleAttributeName : [NSNumber numberWithFloat:0] };
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:content
                                                              attributes:attributes];
    
    self.textLabel.attributedText = str;
    
}

- (IBAction)clearText:(id)sender {
    
    self.textLabel.text=@"";
}

@end
