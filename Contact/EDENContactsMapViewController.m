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

static NSString *const PoolName = @"annotationsPool";

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

- (void) viewWillAppear:(BOOL) animated
{
    [self.map addAnnotations:self.contacts];
}

- (void) viewWillDisappear:(BOOL) animated
{
    [self.map removeAnnotations:self.map.annotations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegate
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    MKPinAnnotationView * annotationView = (MKPinAnnotationView *)[self.map dequeueReusableAnnotationViewWithIdentifier:PoolName];
    
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:PoolName];
    }
    else {
        annotationView.annotation = annotation;
    }
    
    annotationView.pinColor = MKPinAnnotationColorPurple;
    annotationView.canShowCallout = YES;
    
    EDENContactModel * contact = (EDENContactModel *) annotation;
    if (contact.picture) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        imageView.image = contact.picture;
        
        annotationView.leftCalloutAccessoryView = imageView;
    }
    
    return annotationView;
}

@end
