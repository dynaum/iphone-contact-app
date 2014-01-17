//
//  EDENFormContactViewController.m
//  Contact
//
//  Created by Elber Ribeiro on 1/13/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import "EDENFormContactViewController.h"

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
        self.name.text      = self.contact.name;
        self.email.text     = self.contact.email;
        self.phone.text     = self.contact.phone;
        self.address.text   = self.contact.address;
        self.site.text      = self.contact.site;
        self.latitude.text  = [self.contact.latitude  stringValue];
        self.longitude.text = [self.contact.longitude stringValue];
        
        [self.picture setBackgroundImage:self.contact.picture forState:UIControlStateNormal];
        if (self.contact.picture) {
            [self.picture setTitle:@"" forState:UIControlStateNormal];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveContact
{
    EDENContactModel * contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:self.context];
    [self setFormData:contact];
    
    [self.delegate contactAdded:contact];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) editContact
{
    [self setFormData:self.contact];
    
    if ( [self.delegate respondsToSelector:@selector(contactEdited:)] ) {
        [self.delegate contactEdited:self.contact];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) setFormData:(EDENContactModel *)contact {
    contact.name      = self.name.text;
    contact.email     = self.email.text;
    contact.phone     = self.phone.text;
    contact.address   = self.address.text;
    contact.site      = self.site.text;
    contact.picture   = [self.picture backgroundImageForState:UIControlStateNormal];
    contact.latitude  = [NSNumber numberWithDouble: [self.latitude.text doubleValue]];
    contact.longitude = [NSNumber numberWithDouble: [self.longitude.text doubleValue]];
}


- (IBAction) selectPicture:(id)sender
{
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = YES;
    picker.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * image = info[UIImagePickerControllerEditedImage];
    [self.picture setTitle:@"" forState:UIControlStateNormal];
    [self.picture setBackgroundImage:image forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction) searchLocation:(id)sender
{
    [self.activityIndicator startAnimating];
    self.locationButton.hidden = YES;

    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:self.address.text completionHandler: ^(NSArray * results, NSError * error) {
        if (!error && [results count] > 0) {
            CLPlacemark * result = results[0];
            CLLocationCoordinate2D coordinate = result.location.coordinate;
            
            self.latitude.text  = [NSString stringWithFormat:@"%f", coordinate.latitude];
            self.longitude.text = [NSString stringWithFormat:@"%f", coordinate.longitude];
        }
        [self.activityIndicator stopAnimating];
        self.locationButton.hidden = NO;
    }];
}

@end
