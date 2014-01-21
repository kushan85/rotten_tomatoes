//
//  Movies.h
//  tomatoes
//
//  Created by Kushan Shah on 1/20/14.
//  Copyright (c) 2014 Kushan Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movies : NSObject

-(Movies*) initWithTitle: (NSString *) movieTitle Sysnopsis: (NSString *) movieSynopsis Cast: (NSArray *) movieCast profileImage: (NSString *) movieImage origImage: (NSString *) origmovieImage;

-(NSString *)getTitle;
-(NSString *)getSynopsis;
-(NSString *)getCast;
-(NSString *)getProfileImage;
-(NSString *)getOriginalImage;

@end
