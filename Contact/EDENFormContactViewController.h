//
//  EDENFormContactViewController.h
//  Contact
//
//  Created by Elber Ribeiro on 1/13/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDENContactModel.h"

@interface EDENFormContactViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak, atomic) NSMutableArray * contacts;
@property (strong, atomic) EDENContactModel * contact;

- (IBAction)nextField:(UITextField *) currentField;
- (id) initWithContact:(EDENContactModel *) contact;
@end
