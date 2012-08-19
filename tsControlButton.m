//
//  tsJoystickButton.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 18.08.12.
//
//

#import "tsControlButton.h"

@implementation tsControlButton

@synthesize active = _active;
@synthesize radius = _radius;


- (void) onEnterTransitionDidFinish
{
	[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:1 swallowsTouches:YES];
}

- (void) onExit
{
	[[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
}

-(id) initWithRect:(CGRect) rect {
    if ((self = [super init])) {
        _bounds = CGRectMake(0, 0, rect.size.width, rect.size.height);
        _center = CGPointMake(rect.size.width/2, rect.size.height/2);
        
        position_ = rect.origin;
    }
    
    return self;
}

- (void) setRadius:(float) r {
    _radius = r;
}

#pragma mark Touch Delegate

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{

    if (_active) return NO;
    
    CGPoint location = [[CCDirector sharedDirector] convertToGL:[touch locationInView:[touch view]]];
	location = [self convertToNodeSpace:location];
    
    if (location.x < -_radius || location.x > _radius
        || location.y < -_radius || location.y > _radius)
        return NO;
    else {
        CCLOG(@"Finger position x = %f y = %f\n", location.x, location.y);
    }
    
    return NO;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    _active = NO;
}

- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
	[self ccTouchEnded:touch withEvent:event];
}

@end
