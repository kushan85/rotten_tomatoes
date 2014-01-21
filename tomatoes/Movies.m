//
//  Movies.m
//  tomatoes
//
//  Created by Kushan Shah on 1/20/14.
//  Copyright (c) 2014 Kushan Shah. All rights reserved.
//

#import "Movies.h"

@interface Movies ()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *sysnopsis;
@property (nonatomic, strong) NSArray *cast;
@property (nonatomic, strong) NSString *profileImage;
@property (nonatomic, strong) NSString *origImage;

@end

@implementation Movies

-(Movies*) initWithTitle: (NSString *) movieTitle Sysnopsis: (NSString *) movieSynopsis Cast: (NSArray *) movieCast profileImage:(NSString *)movieImage origImage:(NSString *)origmovieImage {
    self = [super init];
    if (self) {
        self.title = movieTitle;
        self.sysnopsis = movieSynopsis;
        self.cast = movieCast;
        self.profileImage = movieImage;
        self.origImage = origmovieImage;
    }
    return self;
}

-(NSString *)getTitle {
    return self.title;
}

-(NSString *)getSynopsis {
    return self.sysnopsis;
}

-(NSString *)getCast {
    NSString *formattedcast = @"";
    for(NSDictionary *dict in self.cast) {
        formattedcast = [formattedcast stringByAppendingString:(NSString *)[dict objectForKey:@"name"]];
        formattedcast = [formattedcast stringByAppendingString:@", "];
    }
    return formattedcast;
}

-(NSString *)getProfileImage {
    return self.profileImage;
}

-(NSString *)getOriginalImage {
    return self.origImage;
}



@end
