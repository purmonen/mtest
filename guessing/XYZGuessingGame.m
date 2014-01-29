//
//  XYZGuessingGame.m
//  guessing
//
//  Created by Sami Purmonen on 2014-01-28.
//  Copyright (c) 2014 Sami Purmonen. All rights reserved.
//

#import "XYZGuessingGame.h"

@interface XYZGuessingGame ()

@property (assign) NSInteger targetNumber;
@property (assign) NSInteger totalGuesses;

@end

@implementation XYZGuessingGame

- (id)init {
    self = [super init];
    if (self) {
        [self reset];
    }
    return self;
}

- (Guess)makeGuess:(NSInteger)guess {
    self.totalGuesses++;
    if (guess > self.targetNumber) {
        return HIGH;
    }
    if (guess < self.targetNumber) {
        return LOW;
    }
    [self reset];
    return CORRECT;
}

- (void)reset {
    self.targetNumber = arc4random() % 100;
    self.totalGuesses = 0;
}

@end
