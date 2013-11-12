//
//  MovieDetailsViewController.h
//  FavoriteMovies
//
//  Created by Sir Andrew on 11/12/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "DCRoundSwitch.h"

@interface MovieDetailsViewController : UIViewController<DCRoundSwitchDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (nonatomic, strong) Movie *movie;
@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UILabel *movieYear;
@property (weak, nonatomic) IBOutlet UILabel *imdbRating;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet DCRoundSwitch *favoriteSwitch;
@property (assign, nonatomic) int objectIndex;

@end
