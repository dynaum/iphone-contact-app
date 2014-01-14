//
//  EDENContactListViewController.m
//  Contact
//
//  Created by Elber Ribeiro on 1/14/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import "EDENContactListViewController.h"
#import "EDENFormContactViewController.h"

@implementation EDENContactListViewController

- (id) init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showForm)];
        self.navigationItem.rightBarButtonItem = buttonItem;
    }
    return self;
}

- (void) showForm
{
    EDENFormContactViewController * form = [[EDENFormContactViewController alloc] init];
    form.contacts = self.contacts;
    
    [self.navigationController pushViewController:form animated:YES];
}

@end
