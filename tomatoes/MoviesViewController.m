//
//  MoviesViewController.m
//  tomatoes
//
//  Created by Kushan Shah on 1/20/14.
//  Copyright (c) 2014 Kushan Shah. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "Movies.h"
#import "MovieViewController.h"
#import "SVProgressHUD.h"

@interface MoviesViewController ()

@property (nonatomic, strong) NSMutableArray *movies;
- (void) reload;
- (void) showLoadingAnimation;

@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self reload];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.navigationItem.title = @"Movies";
        self.movies = [[NSMutableArray alloc] init];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    
    [refresh addTarget:self action:@selector(reload)
      forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    [self reload];
	// Do any additional setup after loading the view.
}

- (void)stopRefresh {
    [self.refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table views

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    Movies *movie = (Movies *)[self.movies objectAtIndex:indexPath.row];
    [cell setTitle: movie.getTitle];
    [cell setSynopsis:movie.getSynopsis];
    [cell setCast:movie.getCast];
    [cell setMovieImageURL:movie.getProfileImage];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    Movies *movie = self.movies[indexPath.row];
    
    MovieViewController *movieViewController = (MovieViewController *)segue.destinationViewController;
    movieViewController.movie = movie;
}
#pragma mark - private methods

- (void) showLoadingAnimation {
    
}

- (void) reload {
    [_activityIndicator setHidden:NO];
    [_activityIndicator startAnimating];
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
        
        if (!connectionError && responseCode == 200){
            [self.movies removeAllObjects];
            NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *movieList = [object objectForKey:@"movies"];
            for(NSDictionary *dict in movieList) {
                NSDictionary *imageURL = [dict objectForKey:@"posters"];
                Movies *movie = [[Movies alloc] initWithTitle:(NSString *)[dict objectForKey:@"title"] Sysnopsis:(NSString *)[dict objectForKey:@"synopsis"] Cast:(NSArray *)[dict objectForKey:@"abridged_cast"] profileImage:(NSString *)[imageURL objectForKey:@"profile"] origImage:(NSString *)[imageURL objectForKey:@"original"]];
                [self.movies addObject:movie];
            }
            
            [self.tableView reloadData];
        }
        else{
            //show error message
            NSLog(@"connectionError=%@", connectionError);
            NSLog(@"responseCode=%d", responseCode);
            [SVProgressHUD showErrorWithStatus:@"Network Error"];
        }
        [_activityIndicator setHidden:YES];
        [_activityIndicator stopAnimating];
    }];
    [self performSelector:@selector(stopRefresh) withObject:nil afterDelay:2.5];
}

@end
