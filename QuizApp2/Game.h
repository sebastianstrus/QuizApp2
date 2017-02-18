//
//  Model.h
//  QuizApp2
//
//  Created by Sebastian Strus on 2017-02-14.
//  Copyright © 2017 Sebastian Strus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface Game : NSObject

@property (nonatomic) NSMutableArray<Question*> *questions;

@property int nrCurrentQuestion;
@property int points;

- (Question*) getQuestion;
- (BOOL)checkAnswer:(NSString *) answer
           Question:(Question *) question;

- (void) addAllQuestions;


@end
