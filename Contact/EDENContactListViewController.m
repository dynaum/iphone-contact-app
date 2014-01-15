//
//  EDENContactListViewController.m
//  Contact
//
//  Created by Elber Ribeiro on 1/14/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import "EDENContactListViewController.h"
#import "EDENFormContactViewController.h"

@interface EDENContactListViewController ()

- (void) cleanupIndex;

@end

@implementation EDENContactListViewController

static NSString *const PoolName = @"contactsPool";

- (void) cleanupIndex
{
    self.selectedIndex = -1;
}

- (id) init
{
    self = [super init];
    
    if (self) {
        self.navigationItem.title = @"Contatos";
        [self cleanupIndex];
        
        UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showForm)];
        self.navigationItem.rightBarButtonItem = buttonItem;
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

- (void) showForm
{
    EDENFormContactViewController * form = [[EDENFormContactViewController alloc] init];
    form.delegate = self;
    
    [self.navigationController pushViewController:form animated:YES];
}

- (void) showMenu:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint gesturePoint = [gesture locationInView:self.tableView];
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:gesturePoint];
        selectedContact = self.contacts[indexPath.row];
        
        UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:selectedContact.name delegate:self cancelButtonTitle:@"deixa queto" destructiveButtonTitle:nil otherButtonTitles:@"Ligar",@"Enviar email",@"Ver site", @"Ver no mapa", nil];
        
        [actionSheet showInView:self.view];
    }
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
    [cell.imageView setImage:item.picture];
    
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EDENContactModel * contact = self.contacts[indexPath.row];
    
    EDENFormContactViewController * form = [[EDENFormContactViewController alloc] initWithContact: contact];
    form.delegate = self;

    [self.navigationController pushViewController:form animated:YES];
}

- (void) viewDidLoad
{
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showMenu:)];
    [self.tableView addGestureRecognizer:longPress];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if (self.selectedIndex > -1) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:self.selectedIndex inSection:0];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        
        [self cleanupIndex];
    }
}

#pragma mark - Actions
- (void) openAppWithUrl:(NSString *)urlString
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}
- (void) showErrorMessage:(NSString *) message
{
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Opss" message:message delegate:nil cancelButtonTitle:@"De boa" otherButtonTitles:nil];
    [alertView show];
}

- (void) actionCall
{
    UIDevice * device = [UIDevice currentDevice];
    
    if ([device.model isEqualToString:@"iPhone"]) {
        NSString * urlString = [NSString stringWithFormat:@"tel:%@", selectedContact.phone];
        [self openAppWithUrl:urlString];
    }
    else {
        [self showErrorMessage:@"Se fudeu"];
    }
}

- (void) actionEmail
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController * mail = [[MFMailComposeViewController alloc] init];
        
        [mail setToRecipients:@[selectedContact.description]];
        [mail setSubject:@"Um email malandrao"];
        
        mail.mailComposeDelegate = self;
        
        [self presentViewController:mail animated:YES completion:nil];
    }
    else {
        [self showErrorMessage:@"Já era mané!"];
    }
}

- (void) actionSite
{
    NSString * urlString = [NSString stringWithFormat:@"http:%@", selectedContact.site];
    [self openAppWithUrl:urlString];
}

- (void) actionMap
{
    NSString * urlString = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", selectedContact.address] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self openAppWithUrl:urlString];
}

#pragma mark - MFMailComposeViewControllerDelegate
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIActionSheetDelegate
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self actionCall];
            break;
        case 1:
            [self actionEmail];
            break;
        case 2:
            [self actionSite];
            break;
        case 3:
            [self actionMap];
            break;
        default:
            break;
    }
}

#pragma mark - EDENFormContactViewControllerDelegate
- (void) contactAdded:(EDENContactModel *)contact
{
    [self.contacts addObject:contact];
    self.selectedIndex = [self.contacts indexOfObject:contact];
}

- (void) contactEdited:(EDENContactModel *)contact
{
    self.selectedIndex = [self.contacts indexOfObject:contact];
}

@end
