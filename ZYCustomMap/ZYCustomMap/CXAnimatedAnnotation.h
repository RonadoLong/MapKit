//
//  CXAnimatedAnnotation.h
//  ZYCustomMap

//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
@interface CXAnimatedAnnotation :NSObject <MAAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, strong) NSMutableArray *animatedImages;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
