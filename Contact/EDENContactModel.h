//
//  EDENContactModel.h
//  Contact
//
//  Created by Elber Ribeiro on 1/13/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface EDENContactModel : NSManagedObject <NSCoding,MKAnnotation>

@property (strong, atomic) NSString * name;
@property (strong, atomic) NSString * email;
@property (strong, atomic) NSString * phone;
@property (strong, atomic) NSString * address;
@property (strong, atomic) NSString * site;
@property (strong, atomic) UIImage  * picture;
@property (strong, atomic) NSNumber * latitude;
@property (strong, atomic) NSNumber * longitude;

@end
