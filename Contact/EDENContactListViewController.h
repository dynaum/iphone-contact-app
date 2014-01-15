//
//  EDENContactListViewController.h
//  Contact
//
//  Created by Elber Ribeiro on 1/14/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDENContactModel.h"

@interface EDENContactListViewController : UITableViewController

@property (weak, atomic) NSMutableArray * contacts;

- (void) contactAdded:(EDENContactModel *) contact;

@end
