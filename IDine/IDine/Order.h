//
//  Order.h
//  IDine
//
//  Created by ketan khare on 28/09/20.
//  Copyright © 2020. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItem.h"


@interface Order : NSObject
@property (class, nonatomic) NSMutableArray* cartArray;
+(void)addItem:(MenuItem *)menuItem;
+(void)removeItem:(MenuItem *)removeItem;
+(double)totalOfOrders;
@end


