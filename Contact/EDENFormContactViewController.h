//
//  EDENFormContactViewController.h
//  Contact
//
//  Created by Elber Ribeiro on 1/13/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "EDENContactModel.h"
#import "EDENFormContactViewControllerDelegate.h"

@interface EDENFormContactViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak, nonatomic) IBOutlet UIButton    *picture;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;

@property (strong, atomic) EDENContactModel * contact;
@property (weak, atomic) id <EDENFormContactViewControllerDelegate> delegate;
@property (weak, nonatomic) NSManagedObjectContext *context;


- (id) initWithContact:(EDENContactModel *) contact;
- (IBAction)selectPicture:(id)sender;
- (IBAction)searchLocation:(id)sender;

@end
