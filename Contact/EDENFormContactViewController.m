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
- (IBAction)getFormData:(id)sender {
    EDENContactModel * contact = [[EDENContactModel alloc] init];
    
    contact.name    = self.name.text;
    contact.email   = self.email.text;
    contact.phone   = self.phone.text;
    contact.address = self.address.text;
    contact.site    = self.site.text;
    
    NSLog(@"Contact added: %@", contact);
    
    [self.view endEditing:YES];
}

@end
