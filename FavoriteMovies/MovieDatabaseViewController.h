//
//  MovieDatabaseViewController.h
//  FavoriteMovies
//
//  Created by Sir Andrew on 11/12/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TITLE @"title"
#define YEAR @"year"
#define RATING @"rating"
#define LINK @"link"
#define IMAGE @"image"

@interface MovieDatabaseViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *movieTable;


@end
