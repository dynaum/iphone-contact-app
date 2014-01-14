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

static NSString *const PoolName = @"contactsPool";

- (id) init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showForm)];
        self.navigationItem.rightBarButtonItem = buttonItem;
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
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
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:PoolName];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:PoolName];
    }
    
    cell.textLabel.text       = item.name;
    cell.detailTextLabel.text = item.email;
    
    return cell;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contacts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    EDENContactModel * contact = self.contacts[sourceIndexPath.row];
    
    [self.contacts removeObjectAtIndex:sourceIndexPath.row];
    [self.contacts insertObject:contact atIndex:destinationIndexPath.row];
}

@end
