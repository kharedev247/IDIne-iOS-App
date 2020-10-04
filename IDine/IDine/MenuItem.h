//
//  MenuItem.h
//  IDine
//
//  Created by ketan khare on 28/09/20.
//  Copyright © 2020. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject
@property(nonatomic, retain) NSString *menuname;
@property(nonatomic, retain) NSString *menuItemID;
@property(nonatomic, retain) NSString *photoCredit;
@property(nonatomic, retain) NSString *description;
@property(nonatomic, retain) NSMutableArray *restrictionsArray;
@property int price;
@property int quantity;
@end
