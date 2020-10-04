//
//  Order.m
//  IDine
//
//  Created by ketan khare on 28/09/20.
//  Copyright © 2020. All rights reserved.
//

#import "Order.h"
#import "MenuItem.h"

@implementation Order
static NSMutableArray*cartArray = nil;

+ (NSMutableArray *)cartArray {
  if (cartArray == nil) {
    cartArray = [[NSMutableArray alloc] init];
  }
  return cartArray;
}

+(void)addItem:(MenuItem *)menuItem{
    BOOL isAlreadyAdded = false;
    if (cartArray == nil) {
      cartArray = [[NSMutableArray alloc] init];
    }
    if(cartArray.count > 0){
        for (int i=0; i<cartArray.count;i++){
            MenuItem *item = cartArray[i];
            if([item.menuItemID isEqualToString:menuItem.menuItemID]){
                menuItem.quantity = menuItem.quantity + 1;
                isAlreadyAdded = true;
                break;
            }else{
                isAlreadyAdded = false;
            }
        }
    }
    
    if (isAlreadyAdded == false || cartArray.count == 0){
        [cartArray addObject:menuItem];
        menuItem.quantity = menuItem.quantity + 1;
    }
}
+(void)removeItem:(MenuItem *)removeItem{
    [cartArray removeObject:removeItem];
}
+(double)totalOfOrders{
    double total=0;
    for (int i=0; i<cartArray.count;i++){
        MenuItem *item = cartArray[i];
        total += item.quantity  * item.price;
    }
    return total;
}


@end
