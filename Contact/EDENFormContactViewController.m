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

- (id) initWithContact:(EDENContactModel *)contact
{
    self = [super init];
    
    if (self) {
        self.contact = contact;
        
        self.navigationItem.title = @"Edição";
        
        UIBarButtonItem * buttonConfirm = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(editContact)];
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
    
    if (self.contact) {
        self.name.text    = self.contact.name;
        self.email.text   = self.contact.email;
        self.phone.text   = self.contact.phone;
        self.address.text = self.contact.address;
        self.site.text    = self.contact.site;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveContact
{
    EDENContactModel * contact = [[EDENContactModel alloc] init];
    [self setFormData:contact];
    
    [self.delegate contactAdded:contact];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) editContact
{
    [self setFormData:self.contact];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) setFormData:(EDENContactModel *)contact {
    contact.name    = self.name.text;
    contact.email   = self.email.text;
    contact.phone   = self.phone.text;
    contact.address = self.address.text;
    contact.site    = self.site.text;
}

- (IBAction)nextField:(UITextField *)currentField {
    UIResponder * nextField = [self.view viewWithTag:(currentField.tag + 1)];
    
    nextField ? [nextField becomeFirstResponder] : [currentField resignFirstResponder];
}

@end
