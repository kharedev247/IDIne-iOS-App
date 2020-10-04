//
//  MenuSection.h
//  IDine
//
//  Created by ketan khare on 28/09/20.
//  Copyright © 2020. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface MenuSection : NSObject
@property(nonatomic,retain) NSString *menuID;
@property(nonatomic,retain) NSString *menuName;
@property(nonatomic,retain) NSMutableArray *items;
@end
