//
//  SetCard.m
//  Matchismo
//
//  Created by Sahil Gandhi on 18/06/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

//-(int)match:(NSArray *)otherCards {
//    // match for n cards
//    int score = 0;
//    if (!otherCards) { // if otherCards is nil
//        return 0;
//    }
//    score += [self calculateScore: otherCards];
//    
//    // for comparison inside the otherCards array
//    NSMutableArray *temp = [otherCards mutableCopy];
//    [temp removeObject:[temp firstObject]];
//    
//    score += [otherCards[0] calculateScore: temp];
//    
//    return score;
//}
//
//-(int)calculateScore:(NSArray *)otherCards {
//    int score = 0;
//    if (!otherCards) { // if otherCards is nil
//        return 0;
//    }
//    for (PlayingCard *card in otherCards) {
//        if (self.rank == card.rank) {
//            score+=4;
//        } else if ([self.suit isEqualToString:card.suit]) {
//            score+=1;
//        }
//    }
//    return score;
//}


-(NSString *)contents {
    NSArray *numberString = [SetCard numbersString ];
    return [[[numberString[self.number]
            stringByAppendingString:self.shading]
            stringByAppendingString:self.color]
            stringByAppendingString:self.symbol];
}
+(NSArray *)numbersString {
    return @[@"?",@"1",@"2",@"3"];
}

+(NSArray *)validSymbols {
    return @[@"▲", @"●", @"◼︎"];
}
+(NSArray *)validShadings {
    return @[@"Solid", @"Striped", @"Open"];
}
+(NSArray *)validColors {
    return @[@"Red", @"Green", @"Purple"];
}
+(NSUInteger)maxNumber {
    return [[self numbersString] count]-1 ;
}

@synthesize symbol = _symbol;
@synthesize shading = _shading;
@synthesize color = _color;
-(NSString *)shading {
    return _shading ? _shading : @"?";
}
-(void)setShading:(NSString *)shading {
    if ([[SetCard validShadings] containsObject:shading]) {
        _shading = shading  ;
    }
}
-(NSString *)color {
    return _color ? _color : @"?";
}
-(void)setColor:(NSString *)color {
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}
-(NSString *)symbol {
    return _symbol ? _symbol : @"?";
}
-(void)setSymbol:(NSString *)symbol {
    if ([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}

-(void)setNumber:(NSUInteger )number {
    if(number <= [SetCard maxNumber]) {
        _number = number;
    } else {
        _number = 0;
    }
}

@end
