//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Sahil Gandhi on 29/05/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;
@property (strong, nonatomic) NSString *scoreLabel;
@property (strong, nonatomic) NSString *cardDescription;

// designated initializer
-(instancetype)initGameWithCardCount:(NSUInteger)count
                           usingDeck:(Deck *)deck
                       withNumberOfCardsToMatch:(NSUInteger)cardCount;
-(void)chosenCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@end
