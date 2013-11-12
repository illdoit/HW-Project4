//
//  FavoriteViewController.m
//  FavoriteMovies
//
//  Created by Sir Andrew on 11/12/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import "FavoriteViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import "MovieStore.h"
#define CELL_REUSE_ID @"MovieCell"

@interface FavoriteViewController ()
{
    NSMutableArray *movies;
}
@end

@implementation FavoriteViewController

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
    for (Movie *movObj in [[MovieStore sharedInstance] movies]) {
        if (movObj.favorite) {
            [movies addObject:movObj];
        }
    }
    
    [_movieTable reloadData];
    NSLog(@"Fave count:%d", [movies count]);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [movies removeAllObjects];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [_movieTable setDelegate:self];
    [_movieTable setDataSource:self];
    
    
    movies = [[NSMutableArray alloc] init];
   
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
    return 102;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(NSString*)documentsPath: (NSString*) filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:filePath];
    
    return getImagePath;
}


@end
