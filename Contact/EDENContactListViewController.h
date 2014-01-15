//
//  EDENContactListViewController.h
//  Contact
//
//  Created by Elber Ribeiro on 1/14/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import "EDENContactModel.h"
#import "EDENFormContactViewControllerDelegate.h"

@interface EDENContactListViewController : UITableViewController <EDENFormContactViewControllerDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
{
    EDENContactModel * selectedContact;
}

@property (weak, atomic) NSMutableArray * contacts;
@property (assign, atomic) NSInteger selectedIndex;

@end
