//
//  CartViewController.h
//  IDine
//
//  Created by ketan khare on 27/09/20.
//  Copyright © 2020. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CartViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *totalCalculation;
@property (strong, nonatomic) IBOutlet UITableView *cartTableView;


@end

NS_ASSUME_NONNULL_END
