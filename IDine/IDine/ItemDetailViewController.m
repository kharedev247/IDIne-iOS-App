//
//  ItemDetailViewController.m
//  IDine
//
//  Created by ketan khare on 27/09/20.
//  Copyright © 2020. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Order.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController
@synthesize menuItem, quantityLabel, menuItemImage, menuItemDesc;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    self.menuItemDesc.text = menuItem.description;
    self.quantityLabel.text = [NSString stringWithFormat:@"%d", menuItem.quantity];
     NSString *imgStr = [[menuItem.menuname stringByReplacingOccurrencesOfString:@" " withString:@"-"] lowercaseString];
    self.menuItemImage.image = [UIImage imageNamed:imgStr];
}

- (IBAction)addQuantityButtonClick:(id)sender {
    [Order addItem:menuItem];
    self.quantityLabel.text = [NSString stringWithFormat:@"%d", menuItem.quantity];
}
- (IBAction)removeQuantityButtonClick:(id)sender {
    menuItem.quantity = (menuItem.quantity <= 1) ? 1 : (menuItem.quantity - 1);
    self.quantityLabel.text = [NSString stringWithFormat:@"%d", menuItem.quantity];
}

@end
