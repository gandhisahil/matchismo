//
//  Deck.h
//  Matchismo
//
//  Created by Sahil Gandhi on 28/05/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card toTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;

@end
