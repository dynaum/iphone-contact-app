//
//  EDENContactsMapViewController.h
//  Contact
//
//  Created by Elber Ribeiro on 1/15/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "EDENContactModel.h"

@interface EDENContactsMapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, atomic) NSMutableArray * contacts;

@end
