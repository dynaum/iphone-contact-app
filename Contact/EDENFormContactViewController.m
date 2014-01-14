//
//  EDENFormContactViewController.m
//  Contact
//
//  Created by Elber Ribeiro on 1/13/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import "EDENFormContactViewController.h"
#import "EDENContactModel.h"

@interface EDENFormContactViewController ()

@end

@implementation EDENFormContactViewController

- (id) init
{
    self = [super init];
    
    if (self) {
        self.navigationItem.title = @"Novo contato";
        
        UIBarButtonItem * buttonConfirm = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(saveContact)];
        self.navigationItem.rightBarButtonItem = buttonConfirm;
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveContact
{
    EDENContactModel * contact = [self getFormData];
    
    [self.view endEditing:YES];
    
    [self.contacts addObject:contact];
    
    NSLog(@"Contact added: %@", self.contacts);
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (EDENContactModel *) getFormData {
    EDENContactModel * contact = [[EDENContactModel alloc] init];
    
    contact.name    = self.name.text;
    contact.email   = self.email.text;
    contact.phone   = self.phone.text;
    contact.address = self.address.text;
    contact.site    = self.site.text;
    
    return contact;
}

- (IBAction)nextField:(UITextField *)currentField {
    UIResponder * nextField = [self.view viewWithTag:(currentField.tag + 1)];
    
    nextField ? [nextField becomeFirstResponder] : [currentField resignFirstResponder];
}

@end
