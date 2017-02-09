//
//  WXMapViewMarkerComponent.m
//  Pods
//
//  Created by yangshengtao on 17/2/6.
//
//

#import "WXMapViewMarkerComponent.h"
#import "WXMapViewComponent.h"
#import "WXComponent_internal.h"

@implementation WXMapViewMarkerComponent
{
    @private BOOL _viewLoaded;
}

@synthesize clickEvent = _clickEvent;
@synthesize icon = _icon;
@synthesize title = _title;
@synthesize location = _location;


- (instancetype)initWithRef:(NSString *)ref
                       type:(NSString*)type
                     styles:(nullable NSDictionary *)styles
                 attributes:(nullable NSDictionary *)attributes
                     events:(nullable NSArray *)events
               weexInstance:(WXSDKInstance *)weexInstance
{
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
        if ([events containsObject:@"click"]) {
            _clickEvent = @"click";
        }
        _location = attributes[@"position"];
        _title = attributes[@"title"];
        _icon = attributes[@"icon"];
    }
    _viewLoaded = NO;
    return self;
}

- (UIView *) loadView
{
    return nil;
}

- (void)viewDidLoad
{
    if (!_viewLoaded) {
        [(WXMapViewComponent *)self.supercomponent addMarker:self];
        _viewLoaded = YES;
    }
}

- (void)_removeFromSupercomponent
{
    [super _removeFromSupercomponent];
    [(WXMapViewComponent *)self.supercomponent removeMarker:self];
}

- (void)dealloc
{
    
}

@end
