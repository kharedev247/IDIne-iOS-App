//
//  ItemDetailViewController.h
//  IDine
//
//  Created by ketan khare on 27/09/20.
//  Copyright © 2020. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemDetailViewController : UIViewController
@property (strong, nonatomic) MenuItem *menuItem;
@property (strong, nonatomic) IBOutlet UIImageView *menuItemImage;
@property (strong, nonatomic) IBOutlet UITextView *menuItemDesc;
@property (strong, nonatomic) IBOutlet UIButton *addQuantity;
@property (strong, nonatomic) IBOutlet UIButton *removeQuantity;
@property (strong, nonatomic) IBOutlet UILabel *quantityLabel;

@end

NS_ASSUME_NONNULL_END
