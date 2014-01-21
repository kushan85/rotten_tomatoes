//
//  MovieCell.m
//  tomatoes
//
//  Created by Kushan Shah on 1/20/14.
//  Copyright (c) 2014 Kushan Shah. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@interface MovieCell ()

@property (nonatomic, strong) IBOutlet UILabel *movieTitle;
@property (nonatomic, strong) IBOutlet UILabel *movieSynopsis;
@property (nonatomic, strong) IBOutlet UILabel *movieCast;
@property (nonatomic, strong) IBOutlet UIImageView *movieImage;

@end

@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - public methods

- (void) setTitle:(NSString *)movieTitle {
    self.movieTitle.text = movieTitle;
}

- (void) setSynopsis:(NSString *)movieSynopsis {
    self.movieSynopsis.text = movieSynopsis;
}

- (void) setCast:(NSString *)movieCast {
    self.movieCast.text = movieCast;
}

- (void) setMovieImageURL:(NSString *)movieImage {
    NSURL *url = [NSURL URLWithString:movieImage];
    [self.movieImage setImageWithURL:url];
}

@end
