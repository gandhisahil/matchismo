//
//  Card.h
//  Matchismo
//
//  Created by Sahil Gandhi on 28/05/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;
-(int)match:(NSArray *)otherCards;

@end
