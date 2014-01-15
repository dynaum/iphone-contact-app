//
//  EDENFormContactViewControllerDelegate.h
//  Contact
//
//  Created by Elber Ribeiro on 1/15/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDENContactModel.h"

@protocol EDENFormContactViewControllerDelegate <NSObject>

- (void) contactAdded: (EDENContactModel *) contact;

@optional

- (void) contactEdited: (EDENContactModel *) contact;

@end
