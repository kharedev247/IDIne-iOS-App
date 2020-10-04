//
//  CartViewCell.h
//  IDine
//
//  Created by ketan khare on 27/09/20.
//  Copyright © 2020. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CartViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemQuantityLabel;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) IBOutlet UIButton *removeButton;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;

@end

NS_ASSUME_NONNULL_END
