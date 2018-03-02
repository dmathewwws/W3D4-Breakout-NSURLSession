//
//  Photo.h
//  W3D4-Breakout-NSURLSession
//
//  Created by Daniel Mathews on 2018-03-01.
//  Copyright © 2018 Daniel Mathews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic) NSURL *url;

- (instancetype)initWithDict:(NSDictionary *)photo;

@end
