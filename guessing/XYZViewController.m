//
//  XYZViewController.m
//  guessing
//
//  Created by Sami Purmonen on 2014-01-28.
//  Copyright (c) 2014 Sami Purmonen. All rights reserved.
//

#import "XYZViewController.h"
#import "XYZGuessingGame.h"

@interface XYZViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@property (nonatomic) NSInteger counter;
@property (nonatomic) XYZGuessingGame *game;

@end

@implementation XYZViewController

- (XYZGuessingGame *)game {
    if (!_game) _game = [[XYZGuessingGame alloc] init];
    return _game;
}

// _counter

- (void)setCounter:(NSInteger)counter {
    _counter = counter;
    self.stepper.value = counter;
    self.slider.value = counter * 0.01;
    self.label.text = [NSString stringWithFormat:@"%d", self.counter];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    self.counter = self.slider.value * 100;
}

- (IBAction)stepperChanged:(UIStepper *)sender {
    self.counter = sender.value;
}

- (IBAction)click:(UIButton *)sender {
    
    Guess guess = [self.game makeGuess:self.counter];
    NSString *response;

    switch (guess) {
        case LOW: response = @"Too low"; break;
        case HIGH: response = @"Too high"; break;
        case CORRECT: response = @"Correct"; break;
    }
    self.label.text = response;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self sliderChanged:self.slider];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
