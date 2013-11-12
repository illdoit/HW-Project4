//
//  Movie.h
//  FavoriteMovies
//
//  Created by Sir Andrew on 11/12/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *year;
@property(nonatomic, strong) NSString *rating;
@property(nonatomic, strong) NSString *image;
@property(nonatomic, strong) NSString *link;
@property(nonatomic, assign) BOOL favorite;
@end
