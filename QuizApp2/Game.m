//
//  Model.m
//  QuizApp2
//
//  Created by Sebastian Strus on 2017-02-14.
//  Copyright © 2017 Sebastian Strus. All rights reserved.
//

#import "Game.h"
#import "Question.h"

@implementation Game
- (BOOL)checkAnswer:(NSString *) answer
             Question:(Question *) question {
    
    return [[question.answers objectAtIndex: (question.id % 4)] isEqualToString: answer];
}

- (void) addAllQuestions {
    self.questions = @[].mutableCopy;
    
    Question *q1 = [[Question alloc] init];
    q1.question = @"Sverige";
    q1.answers = @[@"Goteborg", @"Stockholm", @"Malmo", @"Uppsala"];
    q1.answered = NO;
    q1.id = 1;
    
    Question *q2 = [[Question alloc] init];
    q2.question = @"Polen";
    q2.answers = @[@"Krakow", @"Wroclaw", @"Warszawa", @"Gdansk"];
    q2.answered = NO;
    q2.id = 2;
    
    Question *q3 = [[Question alloc] init];
    q3.question = @"Tyskland";
    q3.answers = @[@"Munchen", @"Hamburg", @"Köln", @"Berlin"];
    q3.answered = NO;
    q3.id = 3;
    
    Question *q4 = [[Question alloc] init];
    q4.question = @"Spanien";
    q4.answers = @[@"Madrid", @"Barcelona", @"Valencia", @"Bilbao"];
    q4.answered = NO;
    q4.id = 4;
    
    Question *q5 = [[Question alloc] init];
    q5.question = @"Frankrike";
    q5.answers = @[@"Lyon", @"Paris", @"Marseille", @"Nice"];
    q5.answered = NO;
    q5.id = 5;
    
    Question *q6 = [[Question alloc] init];
    q6.question = @"Norge";
    q6.answers = @[@"Bergen", @"Stavanger", @"Oslo", @"Trondheim"];
    q6.answered = NO;
    q6.id = 6;
    
    Question *q7 = [[Question alloc] init];
    q7.question = @"Italien";
    q7.answers = @[@"Neapel", @"Milano", @"Turin", @"Rom"];
    q7.answered = NO;
    q7.id = 7;
    
    Question *q8 = [[Question alloc] init];
    q8.question = @"Portugal";
    q8.answers = @[@"Lissabon", @"Porto", @"Braga", @"Funchal"];
    q8.answered = NO;
    q8.id = 8;
    
    Question *q9 = [[Question alloc] init];
    q9.question = @"Grekland";
    q9.answers = @[@"Thessaloniki", @"Aten", @"Patra", @"Larissa"];
    q9.answered = NO;
    q9.id = 9;
    
    Question *q10 = [[Question alloc] init];
    q10.question = @"Danmark";
    q10.answers = @[@"Arhus", @"Odense", @"Kopenhamn", @"Aalborg"];
    q10.answered = NO;
    q10.id = 10;
    
    [self.questions addObject:q1];
    [self.questions addObject:q2];
    [self.questions addObject:q3];
    [self.questions addObject:q4];
    [self.questions addObject:q5];
    [self.questions addObject:q6];
    [self.questions addObject:q7];
    [self.questions addObject:q8];
    [self.questions addObject:q9];
    [self.questions addObject:q10];
}


- (Question*) getQuestion{
    Question *q = self.questions[(arc4random() % self.questions.count)];
    [self.questions removeObject:q];
    return q;
}


-(void) playQuiz {
    
}



@end


