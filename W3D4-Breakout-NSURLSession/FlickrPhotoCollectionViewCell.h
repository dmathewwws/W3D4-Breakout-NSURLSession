//
//  FlickrPhotoCollectionViewCell.h
//  W3D4-Breakout-NSURLSession
//
//  Created by Daniel Mathews on 2018-03-01.
//  Copyright © 2018 Daniel Mathews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhotoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (nonatomic) NSURLSessionDownloadTask *downloadTask;

@end
