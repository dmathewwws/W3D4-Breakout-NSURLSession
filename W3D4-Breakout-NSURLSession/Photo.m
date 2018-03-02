//
//  Photo.m
//  W3D4-Breakout-NSURLSession
//
//  Created by Daniel Mathews on 2018-03-01.
//  Copyright © 2018 Daniel Mathews. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithDict:(NSDictionary *)photo
{
    self = [super init];
    if (self) {
        
        
        NSNumber *farmID = photo[@"farm"];
        NSNumber *secret = photo[@"secret"];
        NSNumber *photoId = photo[@"id"];
        NSString *server = photo[@"server"];
        
        NSString *urlString = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",farmID, server, photoId, secret];
        
        _url = [NSURL URLWithString:urlString];
        
    }
    return self;
}

@end
