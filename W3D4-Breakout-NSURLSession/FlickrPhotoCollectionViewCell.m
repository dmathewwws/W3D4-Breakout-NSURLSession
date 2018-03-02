//
//  FlickrPhotoCollectionViewCell.m
//  W3D4-Breakout-NSURLSession
//
//  Created by Daniel Mathews on 2018-03-01.
//  Copyright © 2018 Daniel Mathews. All rights reserved.
//

#import "FlickrPhotoCollectionViewCell.h"

@implementation FlickrPhotoCollectionViewCell

-(void)prepareForReuse{
    [super prepareForReuse];
    [self.downloadTask cancel];
    self.photoImageView.image = nil;
}

@end
