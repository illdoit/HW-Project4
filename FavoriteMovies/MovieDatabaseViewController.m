//
//  MovieDatabaseViewController.m
//  FavoriteMovies
//
//  Created by Sir Andrew on 11/12/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import "MovieDatabaseViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "MovieDetailsViewController.h"
#import "MovieStore.h"

#define CELL_REUSE_ID @"MovieCell"

@interface MovieDatabaseViewController ()
{
    NSMutableArray *movies;
}
@end

@implementation MovieDatabaseViewController

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
	
    [_movieTable setDelegate:self];
    [_movieTable setDataSource:self];

    movies = [[NSMutableArray alloc] init];

    movies = [[MovieStore sharedInstance] movies];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView Datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSE_ID forIndexPath:indexPath];
    
    Movie *movObj = [movies objectAtIndex:indexPath.row];
    
    cell.title.text = movObj.title;
    cell.year.text = movObj.year;
    cell.thumbnail.image = [UIImage imageWithContentsOfFile:[self documentsPath:[NSString stringWithFormat: @"images/%@", movObj.image]]];
    NSLog(@"%@", [self documentsPath:[NSString stringWithFormat: @"images/%@", movObj.image]]);
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [movies count];
}

#pragma mark UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showMovieDetail"]) {
        NSIndexPath *indexPath = [_movieTable indexPathForSelectedRow];
        MovieDetailsViewController *mdc = segue.destinationViewController;
        mdc.movie = [movies objectAtIndex:indexPath.row];
        mdc.objectIndex = indexPath.row;
        NSLog(@"%@", [movies objectAtIndex:indexPath.row]);
    }
}

-(NSString*)documentsPath: (NSString*) filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:filePath];

    return getImagePath;
}
@end
