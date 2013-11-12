//
//  MovieDetailsViewController.m
//  FavoriteMovies
//
//  Created by Sir Andrew on 11/12/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "ImdbViewController.h"
#import "MovieStore.h"
#import "Movie.h"

@interface MovieDetailsViewController ()

@end

@implementation MovieDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{

    NSLog(@"%@", _movie);
    
    _movieImageView.image =  [UIImage imageWithContentsOfFile:[self documentsPath:[NSString stringWithFormat: @"images/%@", _movie.image]]];
    _movieName.text = _movie.title;
    
    _movieYear.text = _movie.year;
    
    _imdbRating.text = _movie.rating;

    //previously set favorite will displayed if set previously
    _favoriteSwitch.on = _movie.favorite;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_scrollView.translatesAutoresizingMaskIntoConstraints = NO;
     [_scrollView setContentSize:CGSizeMake(320, 600)];
    
    [_favoriteSwitch setDelegate:self];
    [_favoriteSwitch setOffText:@"NO"];
    [_favoriteSwitch setOnText:@"YES"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showImdb"]) {

        ImdbViewController *ivc = segue.destinationViewController;
        ivc.imdbURL = _movie.link;
    }
}

-(NSString*)documentsPath: (NSString*) filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:filePath];
    
    return getImagePath;
}

-(void)switchDidChange:(BOOL) on
{
    NSLog(@"Switch changed", nil);
    [[[[MovieStore sharedInstance] movies] objectAtIndex:_objectIndex] setFavorite:on];
}
@end
