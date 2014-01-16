//
//  EDENContactsMapViewController.m
//  Contact
//
//  Created by Elber Ribeiro on 1/15/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import "EDENContactsMapViewController.h"

@interface EDENContactsMapViewController ()

@end

@implementation EDENContactsMapViewController

- (id) init
{
    self = [super init];
    
    if (self) {
        UIImage * contactImage = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem * tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:contactImage tag:1];
        
        self.tabBarItem = tabBarItem;
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
    MKUserTrackingBarButtonItem * button = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.map];
    self.navigationItem.leftBarButtonItem = button;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
