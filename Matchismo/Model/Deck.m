//
//  Deck.m
//  Matchismo
//
//  Created by Sahil Gandhi on 28/05/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import "Deck.h"

@interface Deck()
//private declaration
@property (strong, nonatomic) NSMutableArray *cards; // of card
@end

@implementation Deck

// overriding the getter method
-(NSMutableArray *)cards {
    // creating cards array if its nil
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void)addCard:(Card *)card toTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0]; // add card at top
    } else {
        [self.cards addObject:card]; // add card at bottom
    }
}
-(void)addCard:(Card *)card {
    [self addCard:card toTop:NO];
}
-(Card *)drawRandomCard {
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index]; // remove card from deck after drawing it
    }
    return randomCard;
}

@end
