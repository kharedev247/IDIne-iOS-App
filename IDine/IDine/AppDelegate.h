//
//  AppDelegate.h
//  IDine
//
//  Created by ketan khare on 27/09/20.
//  Copyright © 2020. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

