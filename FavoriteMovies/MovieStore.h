//
//  MovieStore.h
//  FavoriteMovies
//
//  Created by Sir Andrew on 11/12/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieStore : NSObject
@property (nonatomic, strong) NSMutableArray *movies;
+ (id)sharedInstance;
@end
