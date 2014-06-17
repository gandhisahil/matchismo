//
//  SetCard.h
//  Matchismo
//
//  Created by Sahil Gandhi on 18/06/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger number;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *shading;
@property (nonatomic, strong) NSString *color;
+(NSArray *)numbersString;
+(NSArray *)validSymbols;
+(NSArray *)validShadings;
+(NSArray *)validColors;
+(NSUInteger)maxNumber;

@end
