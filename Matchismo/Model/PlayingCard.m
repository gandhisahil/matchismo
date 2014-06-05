//
//  PlayingCard.m
//  Matchismo
//
//  Created by Sahil Gandhi on 28/05/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards {
    // match for n cards
    int score = 0;
    if (!otherCards) { // if otherCards is nil
        return 0;
    }
    score += [self calculateScore: otherCards];
    
    // for comparison inside the otherCards array
    NSMutableArray *temp = [otherCards mutableCopy];
    [temp removeObject:[temp firstObject]];
    
    score += [otherCards[0] calculateScore: temp];
    
    return score;
}

-(int)calculateScore:(NSArray *)otherCards {
    int score = 0;
    if (!otherCards) { // if otherCards is nil
        return 0;
    }
    for (PlayingCard *card in otherCards) {
        if (self.rank == card.rank) {
            score+=4;
        } else if ([self.suit isEqualToString:card.suit]) {
            score+=1;
        }
    }
    return score;
}


-(NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)validSuits{
    return @[@"♣︎",@"♥︎",@"♦︎",@"♠︎"];
}

+(NSArray *)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank {
    return [[self rankStrings] count]-1 ;
}

@synthesize suit = _suit; // because we change both setter AND getter
// overriding getter for suit to handle nil values
-(NSString *)suit {
    return _suit ? _suit : @"?";
}
// override setter for suit to have only 4 suits
-(void)setSuit:(NSString *)suit {
    
    if ([[PlayingCard validSuits] containsObject:suit ]) {
        _suit = suit;
    }
    
}

-(void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    } else {
        _rank = 0;
    }
}

@end

