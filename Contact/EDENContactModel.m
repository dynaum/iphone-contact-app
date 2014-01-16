//
//  EDENContactModel.m
//  Contact
//
//  Created by Elber Ribeiro on 1/13/14.
//  Copyright (c) 2014 Dinda.com.br. All rights reserved.
//

#import "EDENContactModel.h"

@implementation EDENContactModel

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        self.name      = [aDecoder decodeObjectForKey:@"name"];
        self.email     = [aDecoder decodeObjectForKey:@"email"];
        self.phone     = [aDecoder decodeObjectForKey:@"phone"];
        self.address   = [aDecoder decodeObjectForKey:@"address"];
        self.site      = [aDecoder decodeObjectForKey:@"site"];
        self.picture   = [aDecoder decodeObjectForKey:@"picture"];
        self.latitude  = [aDecoder decodeObjectForKey:@"latitude"];
        self.longitude = [aDecoder decodeObjectForKey:@"longitude"];
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat: @"%@ <%@>", self.name, self.email];
}

- (void) encodeWithCoder : (NSCoder *) aCoder
{
    [aCoder encodeObject:self.name      forKey:@"name"];
    [aCoder encodeObject:self.email     forKey:@"email"];
    [aCoder encodeObject:self.phone     forKey:@"phone"];
    [aCoder encodeObject:self.address   forKey:@"address"];
    [aCoder encodeObject:self.site      forKey:@"site"];
    [aCoder encodeObject:self.picture   forKey:@"picture"];
    [aCoder encodeObject:self.latitude  forKey:@"latitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
}

@end
