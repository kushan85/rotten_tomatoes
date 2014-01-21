//
//  MovieViewController.m
//  tomatoes
//
//  Created by Kushan Shah on 1/20/14.
//  Copyright (c) 2014 Kushan Shah. All rights reserved.
//

#import "MovieViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieViewController ()

@property (nonatomic, strong) IBOutlet UILabel *detailSynopsis;
@property (nonatomic, strong) IBOutlet UILabel *detailCast;
@property (nonatomic, strong) IBOutlet UIImageView *detailImage;

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setSynopsis:self.movie.getSynopsis];
    [self setCast:self.movie.getCast];
    [self setMovieImageURL:self.movie.getOriginalImage];
    self.navigationItem.title = self.movie.getTitle;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public methods

- (void) setSynopsis:(NSString *)detailSynopsis {
    self.detailSynopsis.text = detailSynopsis;
}

- (void) setCast:(NSString *)detailCast {
    self.detailCast.text = detailCast;
}

- (void) setMovieImageURL:(NSString *)detailImage {
    NSURL *url = [NSURL URLWithString:detailImage];
    [self.detailImage setImageWithURL:url];
}

@end
