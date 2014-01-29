//
//  XYZGuessingGame.h
//  guessing
//
//  Created by Sami Purmonen on 2014-01-28.
//  Copyright (c) 2014 Sami Purmonen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum Guess {
    LOW,
    HIGH,
    CORRECT
} Guess;

@interface XYZGuessingGame : NSObject

- (Guess)makeGuess:(NSInteger)guess;

@end