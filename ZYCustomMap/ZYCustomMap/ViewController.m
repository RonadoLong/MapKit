//
//  ViewController.m
//  ZYCustomMap
//
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
#import "CXAnimatedAnnotation.h"
#import "AnimatedAnnotationView.h"
@interface ViewController ()<MAMapViewDelegate>
{
    MAMapView *_mapView;
}
@property (nonatomic, strong) CXAnimatedAnnotation *animatedCarAnnotation;
@property(nonatomic,strong)MAUserLocation *userLocation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MAMapServices sharedServices].apiKey = @"8b6a036e7be5b0283ff1600c9795599f";
    
    _mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0,
                                                          CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds))];
    _mapView.delegate =  self;
    [self.view addSubview:_mapView];
    
    _mapView.showsUserLocation = YES;
    [_mapView setUserTrackingMode:MAUserTrackingModeFollow];
//    [_mapView setZoomLevel:16.1 animated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [self addCarAnnotationWithCoordinate:CLLocationCoordinate2DMake(23.107557, 113.338031)];
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[CXAnimatedAnnotation class]]) {
        static NSString *animatedAnnotationIdentifier = @"AnimatedAnnotationIdentifier";
        AnimatedAnnotationView *annotationView = (AnimatedAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:animatedAnnotationIdentifier];
        if (annotationView == nil)
        {
            annotationView = [[AnimatedAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:animatedAnnotationIdentifier];
            annotationView.canShowCallout = YES;
            annotationView.draggable = YES;
            
        }
        
        return annotationView;
    }
    return nil;
}

-(void)addCarAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSMutableArray *carImages = [[NSMutableArray alloc] init];
    [carImages addObject:[UIImage imageNamed:@"animation_1"]];
    [carImages addObject:[UIImage imageNamed:@"animation_2"]];
    [carImages addObject:[UIImage imageNamed:@"animation_3"]];
    [carImages addObject:[UIImage imageNamed:@"animation_4"]];
    [carImages addObject:[UIImage imageNamed:@"animation_5"]];
    [carImages addObject:[UIImage imageNamed:@"animation_6"]];
    [carImages addObject:[UIImage imageNamed:@"animation_7"]];
    [carImages addObject:[UIImage imageNamed:@"animation_8"]];
    [carImages addObject:[UIImage imageNamed:@"animation_9"]];
    
    self.animatedCarAnnotation = [[CXAnimatedAnnotation alloc] initWithCoordinate:coordinate];

        
        self.animatedCarAnnotation.animatedImages   = carImages;
 
        self.animatedCarAnnotation.title            = @"AutoNavi";
        self.animatedCarAnnotation.subtitle         = [NSString stringWithFormat:@"Car: %lu images",(unsigned long)[self.animatedCarAnnotation.animatedImages count]];
    
    [_mapView addAnnotation:self.animatedCarAnnotation];
}
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        self.userLocation = userLocation;

    }
}

//- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
//{
//    MAAnnotationView *view = views[0];
//    // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
//    if ([view.annotation isKindOfClass:[MAUserLocation class]])
//    {
//        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
//        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.3];
//        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
//        pre.image = [UIImage imageNamed:@"location.png"];
//        pre.lineWidth = 3;
//        pre.lineDashPattern = @[@6, @3];
//        
//        [_mapView updateUserLocationRepresentation:pre];
//        
//        view.calloutOffset = CGPointMake(0, 0);
//    }
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
