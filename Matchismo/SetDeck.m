//
//  SetDeck.m
//  Matchismo
//
//  Created by Sahil Gandhi on 18/06/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck

-(instancetype)init {
    self = [super init];
    if(self) {
        for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++) {
            for (NSString *symbol in [SetCard validSymbols]) {
                for (NSString *shading in [SetCard validShadings]) {
                    for (NSString *color in [SetCard validColors]) {
                        SetCard *card = [[SetCard init] alloc];
                        card.number = number;
                        card.symbol = symbol;
                        card.shading = shading;
                        card.color = color;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}

@end
