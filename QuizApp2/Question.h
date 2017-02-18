//
//  Question.h
//  QuizApp2
//
//  Created by Sebastian Strus on 2017-02-17.
//  Copyright © 2017 Sebastian Strus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic) NSString *question;
@property (nonatomic) NSArray *answers;
/*@property (nonatomic) NSString *answerA;
@property (nonatomic) NSString *answerB;
@property (nonatomic) NSString *answerC;
@property (nonatomic) NSString *answerD;*/
@property (nonatomic) BOOL answered;
@property (nonatomic) int id;

@end
