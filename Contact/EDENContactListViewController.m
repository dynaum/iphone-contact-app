//
//  EDENContactListViewController.m
//  Contact
//
//  Created by Elber Ribeiro on 1/14/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import "EDENContactListViewController.h"
#import "EDENFormContactViewController.h"
#import "EDENContactModel.h"

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

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contacts count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EDENContactModel * item = [self.contacts objectAtIndex:indexPath.row];
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    cell.textLabel.text       = item.name;
    cell.detailTextLabel.text = item.email;
    
    return cell;
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

@end
