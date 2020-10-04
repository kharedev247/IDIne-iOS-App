//
//  CartViewController.m
//  IDine
//
//  Created by ketan khare on 27/09/20.
//  Copyright © 2020. All rights reserved.
//

#import "CartViewController.h"
#import "CartViewCell.h"
#import "Order.h"
#import "MenuItem.h"


@interface CartViewController ()

@end

@implementation CartViewController
@synthesize cartTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [cartTableView registerNib:[UINib nibWithNibName:@"CartViewCell" bundle:nil] forCellReuseIdentifier:@"CartViewCell"];
    // Do any additional setup after loading the view.
    self.cartTableView.delegate = self;
    self.cartTableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [cartTableView reloadData];
    NSLog(@"=== v == %lu", (unsigned long)Order.cartArray.count);
    self.totalCalculation.text = [NSString stringWithFormat:@"$ %0.2f", [Order totalOfOrders]];
}

#pragma mark- Table View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return Order.cartArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CartViewCell *cartCell = [tableView dequeueReusableCellWithIdentifier:@"CartViewCell" forIndexPath:indexPath];
    
    MenuItem *item = Order.cartArray[indexPath.row];
    cartCell.itemNameLabel.text = item.menuname;
    cartCell.itemPriceLabel.text = [NSString stringWithFormat:@"$ %d", item.price * item.quantity];
    cartCell.itemQuantityLabel.text = [NSString stringWithFormat:@"%d", item.quantity];
    
    NSString *imgStr = [[item.menuname stringByReplacingOccurrencesOfString:@" " withString:@"-"] stringByAppendingFormat:@"-thumb"];
    cartCell.itemImage.image = [UIImage imageNamed:[imgStr lowercaseString]];
    
    
    [cartCell.addButton addTarget:self action:@selector(addBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    cartCell.addButton.tag = indexPath.row;
    [cartCell.removeButton addTarget:self action:@selector(removeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    cartCell.removeButton.tag = indexPath.row;
    return cartCell;
}

-(IBAction)addBtnClicked:(UIButton *)sender {
    MenuItem *item = Order.cartArray[sender.tag];
    [Order addItem:item];
    [cartTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[sender tag] inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    self.totalCalculation.text = [NSString stringWithFormat:@"$ %0.2f", [Order totalOfOrders]];
}

-(IBAction)removeBtnClicked:(UIButton *)sender {
    MenuItem *item = Order.cartArray[sender.tag];
    item.quantity = (item.quantity <= 1) ? 1 : (item.quantity - 1);
    [Order.cartArray removeObjectAtIndex:[sender tag]];
    [Order.cartArray insertObject:item atIndex:[sender tag]];
    [cartTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[sender tag] inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    self.totalCalculation.text = [NSString stringWithFormat:@"$ %0.2f", [Order totalOfOrders]];
}

@end
