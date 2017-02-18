//
//  ViewController.m
//  QuizApp2
//
//  Created by Sebastian Strus on 2017-02-02.
//  Copyright © 2017 Sebastian Strus. All rights reserved.
//
#import "ViewController.h"
#import "Game.h"
#import "Question.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioPlayer *_audioPlayer;
}

@property (nonatomic) Game *game;
@property (nonatomic) Question *currentQuestion;
@property (weak, nonatomic) IBOutlet UILabel *nrQuestionLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UILabel *answerInfo;
@property (weak, nonatomic) IBOutlet UILabel *resultInfo;
@property (weak, nonatomic) IBOutlet UIButton *btnNextQuestion;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayAgain;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNiceView];
    self.game = [[Game alloc] init];
    self.game.nrCurrentQuestion = 1;
    self.game.points = 0;
    [self.game addAllQuestions];
    self.btnPlayAgain.hidden=YES;
    [self setNewQuestion];
    self.answerInfo.text = @"";
}

- (IBAction)guessPressed:(UIButton *)sender {
    NSString * checkedBtn = [[sender titleLabel] text];
    BOOL right = [self.game checkAnswer:checkedBtn Question:self.currentQuestion];
    if (right) {
        self.answerInfo.textColor = [UIColor colorWithRed:0 green:256 blue:0 alpha:1.0];
        if(!self.currentQuestion.answered) {
            self.game.points++;
            self.currentQuestion.answered = YES;
            self.answerInfo.text = @"Rätt! (+1)";
        } else {
            self.answerInfo.text = @"Rätt!";
        }
    } else {
        self.answerInfo.text = @"Fel!";
        self.answerInfo.textColor = [UIColor colorWithRed:204 green:0 blue:0 alpha:1.0];
        self.currentQuestion.answered = YES;
    }
    if (self.game.nrCurrentQuestion == 5) {
        self.resultInfo.hidden=NO;
        self.resultInfo.text = [NSString stringWithFormat: @"Resultat: %d/5 poäng.", self.game.points];
        [self playResult];
        
        
    }
}

- (IBAction)nextQuestionPressed:(UIButton *)sender {
    self.currentQuestion.answered = NO;
    self.answerInfo.text = @"";
    if(self.game.nrCurrentQuestion < 5) {
        self.currentQuestion.answered = NO;
        self.game.nrCurrentQuestion++;
        [self setNewQuestion];
        self.nrQuestionLabel.text = [NSString stringWithFormat: @"Fråga: %d/5", self.game.nrCurrentQuestion];
    } else {
        self.btnPlayAgain.hidden=NO;
        self.resultInfo.hidden=NO;
        self.currentQuestion.answered = YES;
        self.resultInfo.text = [NSString stringWithFormat: @"Resultat: %d/5 poäng.", self.game.points];
        [self playResult];
        
    }
}

- (IBAction)playAgain:(UIButton *)sender {
    [self.game addAllQuestions];
    [self setNewQuestion];
    self.btnPlayAgain.hidden=YES;
    self.game.nrCurrentQuestion = 1;
    self.game.points = 0;
    self.resultInfo.text = @"";
    self.answerInfo.text = @"";
    self.nrQuestionLabel.text = [NSString stringWithFormat: @"Fråga: %d/5", self.game.nrCurrentQuestion];
}

- (void)setNewQuestion {
    self.currentQuestion = [self.game getQuestion];
    self.questionLabel.text = _currentQuestion.question;
    [self.btn1 setTitle: [_currentQuestion.answers objectAtIndex: 0] forState:UIControlStateNormal];
    [self.btn2 setTitle: [_currentQuestion.answers objectAtIndex: 1] forState:UIControlStateNormal];
    [self.btn3 setTitle: [_currentQuestion.answers objectAtIndex: 2] forState:UIControlStateNormal];
    [self.btn4 setTitle: [_currentQuestion.answers objectAtIndex: 3] forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// improves the appearance of the application
- (void)setNiceView {
    self.btn1.layer.borderWidth = 1.0f;
    self.btn2.layer.borderWidth = 1.0f;
    self.btn3.layer.borderWidth = 1.0f;
    self.btn4.layer.borderWidth = 1.0f;
    
    self.btnNextQuestion.layer.borderWidth = 1.0f;
    self.btnPlayAgain.layer.borderWidth = 1.0f;
}



-(void)playResult {
    if (self.game.points == 5) {
        [self playAplause];
    } else {
        [self playDisapproval];
    }
}

-(void)playAplause {
    NSString *path = [NSString stringWithFormat:@"%@/applause.mp3", [[NSBundle mainBundle]resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [_audioPlayer play];
}

-(void)playDisapproval {
    NSString *path = [NSString stringWithFormat:@"%@/mysound.mp3", [[NSBundle mainBundle]resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [_audioPlayer play];
}

@end
