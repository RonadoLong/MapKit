//
//  CXAnimatedAnnotation.m
//  ZYCustomMap
//
//

#import "CXAnimatedAnnotation.h"

@implementation CXAnimatedAnnotation
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    if (self = [super init])
    {
        self.coordinate = coordinate;
    }
    return self;
}
@end
