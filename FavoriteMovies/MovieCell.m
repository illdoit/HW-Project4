//
//  MovieCell.m
//  FavoriteMovies
//
//  Created by Sir Andrew on 11/12/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import "MovieCell.h"

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

@end
