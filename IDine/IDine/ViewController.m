//
//  ViewController.m
//  IDine
//
//  Created by ketan khare on 27/09/20.
//  Copyright © 2020. All rights reserved.
//

#import "ViewController.h"
#import "MenuSection.h"
#import "MenuItem.h"
#import "ItemViewCell.h"
#import "ItemDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize menuSectionArray, menuTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    menuSectionArray = [[NSMutableArray alloc] init];
    [menuTableView registerNib:[UINib nibWithNibName:@"ItemViewCell" bundle:nil] forCellReuseIdentifier:@"ItemViewCell"];
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    // Do any additional setup after loading the view.
    [self getAllData];
}

-(void)getAllData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"menu" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"===== data ==== %@", array);
    for (int i=0 ; i<array.count ; i++) {
        NSDictionary *menuDict = array[i];
        MenuSection *menu = [[MenuSection alloc] init];
        menu.menuID = [menuDict valueForKey:@"id"];
        menu.menuName = [menuDict valueForKey:@"name"];
        menu.items = [[NSMutableArray alloc] init];
        NSArray *local_menuItemArray = [menuDict valueForKey:@"items"];
        for (int j=0 ; j<local_menuItemArray.count ; j++) {
            NSDictionary *itemDict = local_menuItemArray[j];
            MenuItem *menuItem = [[MenuItem alloc] init];
            menuItem.menuItemID = [itemDict valueForKey:@"id"];
            menuItem.description = [itemDict valueForKey:@"description"];
            menuItem.menuname = [itemDict valueForKey:@"name"];
            menuItem.photoCredit = [itemDict valueForKey:@"photoCredit"];
            menuItem.price = [[itemDict valueForKey:@"price"] intValue];
            menuItem.quantity = 1;
            [menu.items addObject:menuItem];
        }
        [menuSectionArray addObject:menu];
    }
    [self.menuTableView reloadData];
}

#pragma mark- TableView Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (menuSectionArray.count > 0) {
        return menuSectionArray.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (menuSectionArray.count > 0) {
        MenuSection *menuSection = menuSectionArray[section];
        return menuSection.items.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuSection *menuSectionList = menuSectionArray[indexPath.section];
    MenuItem *menuItem = menuSectionList.items[indexPath.row];
    ItemViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"ItemViewCell" forIndexPath:indexPath];
    itemCell.itemLabel.text = menuItem.menuname;
    itemCell.itemPrice.text = [NSString stringWithFormat:@"$ %d",menuItem.price];
    NSString *imgStr = [[menuItem.menuname stringByReplacingOccurrencesOfString:@" " withString:@"-"] stringByAppendingFormat:@"-thumb"];
    itemCell.itemImage.image = [UIImage imageNamed:[imgStr lowercaseString]];
    itemCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    itemCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return itemCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MenuSection *menuSection = menuSectionArray[section];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.view.frame.size.width, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.text = menuSection.menuName;
    label.font = [UIFont boldSystemFontOfSize:15];
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ItemDetailViewController *itemDetailViewController = [storyBoard instantiateViewControllerWithIdentifier:@"ItemDetailViewController"];
    
    MenuSection *menuSection = menuSectionArray[indexPath.section];
    MenuItem *item = menuSection.items[indexPath.row];
    itemDetailViewController.menuItem = item;
    
 
    [self.navigationController pushViewController:itemDetailViewController animated:true];
}

@end
