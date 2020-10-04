//
//  ItemViewCell.m
//  IDine
//
//  Created by ketan khare on 27/09/20.
//  Copyright © 2020. All rights reserved.
//

#import "ItemViewCell.h"

@implementation ItemViewCell
@synthesize itemPrice, itemLabel, itemImage;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
