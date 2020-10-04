//
//  ViewController.h
//  IDine
//
//  Created by ketan khare on 27/09/20.
//  Copyright © 2020. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSMutableArray *menuSectionArray;
@property (strong, nonatomic) IBOutlet UITableView *menuTableView;

@end

