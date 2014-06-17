//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Sahil Gandhi on 29/05/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score; // re-declare "score" as read-WRITE
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic) NSUInteger cardCount; // 1 or n
@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(instancetype)init{
    return nil;
}
-(instancetype)initGameWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck withNumberOfCardsToMatch:(NSUInteger)cardCount {
    self = [super init];
    if (self) {
        self.cardCount = cardCount;
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
            [self.cards addObject:card]; // add to the array "cards"
            } else {
                self = nil;
                break;
            }

        }
    }
    return self;
}

-(void)chosenCardAtIndex:(NSUInteger)index {
    
    Card *card = [self.cards objectAtIndex:index];
    NSInteger tempScore = 0;
    if (!card.isMatched) {
        if(card.isChosen){
            card.chosen = NO;
            self.cardDescription = [NSString stringWithFormat:@"No card chosen"];
        } else {
            // match against other chosen cards
            
            // make an array of the current chosen non-matched cards
            NSMutableArray *currentChosenCards = [[NSMutableArray alloc] init]; // of Card
            self.cardDescription = [NSString stringWithFormat:@"Chose card %@", [card contents]];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [currentChosenCards addObject:otherCard];
                }
            }
            
            // check if currentChosenCards array has enough cards to match
            // 'self.cardCount-1' because the last card is in 'card' variable
            if ([currentChosenCards count] == self.cardCount-1) {
                int matchScore = [card match:currentChosenCards];
                if (matchScore) {
                    // matched
//                    self.score += matchScore * MATCH_BONUS;
                    tempScore += matchScore * MATCH_BONUS;
                    NSMutableString *cardsDesc = [[card contents] mutableCopy];

                    card.matched = YES;
                    for (Card *otherCard in currentChosenCards) {
                        otherCard.matched = YES;
                        [cardsDesc appendString:[otherCard contents]];
                    }
                    // description..
                    self.cardDescription = [NSString stringWithFormat:@"Matched %@", cardsDesc];
                } else {
                    // no match
//                    self.score -= MISMATCH_PENALTY;
                    tempScore -= MISMATCH_PENALTY;
                    NSMutableString *cardsDesc = [[card contents] mutableCopy];
                    for (Card *otherCard in currentChosenCards) {
                        otherCard.chosen = NO;
                        [cardsDesc appendString:[otherCard contents]];
                    }
                    // description
                    self.cardDescription = [NSString stringWithFormat:@"%@ don't match", cardsDesc];
                }
            }
//            self.score -= COST_TO_CHOOSE;
            tempScore -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    } else {
        self.cardDescription = [NSString stringWithFormat:@"Card is already matched"];
    }
    self.score += tempScore;
    self.scoreLabel=@"";
    if (tempScore>0) {
        self.scoreLabel=[NSString stringWithFormat:@" with score: %d", tempScore];
    } else if (tempScore <0){
        self.scoreLabel=[NSString stringWithFormat:@" with penalty: %d", tempScore];
    }
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return index < [self.cards count] ? [self.cards objectAtIndex:index] : nil;
}

@end
