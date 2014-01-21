//
//  MovieCell.h
//  tomatoes
//
//  Created by Kushan Shah on 1/20/14.
//  Copyright (c) 2014 Kushan Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

- (void) setTitle:(NSString *)movieTitle;
- (void) setSynopsis:(NSString *)movieSynopsis;
- (void) setCast:(NSString *)movieCast;
-(void) setMovieImageURL:(NSString *)movieImage;

@end
