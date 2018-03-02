//
//  ViewController.m
//  W3D4-Breakout-NSURLSession
//
//  Created by Daniel Mathews on 2018-03-01.
//  Copyright © 2018 Daniel Mathews. All rights reserved.
//

#import "ViewController.h"
#import "FlickrPhotoCollectionViewCell.h"
#import "Photo.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) NSMutableArray *photos;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.photos = [NSMutableArray array];
    
    NSString *flickURLString = @"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=ef4d8941b6daa978364ffd6588d1810e&tags=cat";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:flickURLString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *error2 = nil;
        
        NSDictionary *rootPhotoDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error2];
        
        NSDictionary *photosDict = rootPhotoDict[@"photos"];
        
        NSArray *photosArray = photosDict[@"photo"];
        
        for (NSDictionary *photo in photosArray){
            NSLog(@"photo is %@", photo);
            
            Photo *photoObject = [[Photo alloc] initWithDict:photo];

            [self.photos addObject:photoObject];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });

        
    }];
    
    [dataTask resume];
    
    NSLog(@"outside completionHandler");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FlickrPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"catCell" forIndexPath:indexPath];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    Photo *photo = self.photos[indexPath.row];
    
    cell.downloadTask = [session downloadTaskWithURL:photo.url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.photoImageView.image = image;
        });
        
    }];

    [cell.downloadTask resume];
    
    return cell;
    
}


@end
