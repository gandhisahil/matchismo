//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Sahil Gandhi on 28/05/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchMode;
@property (nonatomic) NSInteger cardCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchModeLabel;
@property (weak, nonatomic) IBOutlet UILabel *moveDescriptionLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@end

@implementation CardGameViewController

- (IBAction)changeMatchMode:(id)sender {

    if (self.matchMode.selectedSegmentIndex == 1) {
        // 3-card game
        self.cardCount = 3;
        self.matchModeLabel.text = [NSString stringWithFormat:@"match mode: 3 cards"];
    } else {
        // 2-card game
        self.cardCount = 2;
        self.matchModeLabel.text = [NSString stringWithFormat:@"match mode: 2 cards"];
    }
    [self resetGame];
}

- (IBAction)resetGameButton:(id)sender {
    self.cardCount = 0;
    if (!self.matchMode.enabled) {
        self.matchMode.enabled = YES;
        self.matchMode.selectedSegmentIndex = -1;
        self.matchModeLabel.text = [NSString stringWithFormat:@"select match mode..."];
    }

    // wait for user to choose match mode and call resetGame from changeMatchMode method
}

-(void)resetGame{
    self.game = [[CardMatchingGame alloc] initGameWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck]
                                                  withCardCount:self.cardCount];
    [self updateUI];

}

-(CardMatchingGame *)game{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initGameWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck]
                                                  withCardCount:self.cardCount];
        }
    return _game;
}

-(Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if (self.matchMode.enabled) {
        if (self.cardCount == 0) {
            self.matchModeLabel.text = [NSString stringWithFormat:@"select match mode!!"];
            return;
        }
        self.matchMode.enabled = NO;
    }
    
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chosenCardAtIndex:chosenButtonIndex];
    
    // for moveDescription

    self.moveDescriptionLabel.text = [self.game.cardDescription  stringByAppendingString:self.game.scoreLabel];
    
    [self updateUI];
}

-(void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self setImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

-(UIImage *)setImageForCard:(Card *) card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

-(NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

@end
