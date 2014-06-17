//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Sahil Gandhi on 18/06/14.
//  Copyright (c) 2014 Sahil Gandhi. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetDeck.h"
#import "CardMatchingGame.h"

@interface SetGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *moveDescriptionLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic, strong) CardMatchingGame *game;
@end

@implementation SetGameViewController

-(void)viewDidLoad {
    // initialize the game(face-up) for the first time
    [self resetGame];
}
-(void)viewWillAppear:(BOOL)animated {
    [self updateUI];
}

-(void)updateUI {
    
}

-(Deck *)createDeck {
    return [[SetDeck alloc] init];
}

-(CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initGameWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck] withNumberOfCardsToMatch:3];
    }
    return _game;
}

-(void)resetGame {
    self.game = [[CardMatchingGame alloc] initGameWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck] withNumberOfCardsToMatch:3];
    [self updateUI];
}

- (IBAction)resetButton:(id)sender {
    [self resetGame];
}
@end
