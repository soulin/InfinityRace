//
//  PlayerManager.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "PlayerManager.h"


@implementation PlayerManager

@synthesize player = _player;

-(id) initWithWorld:(b2World *)world
{
    if (self = [super init] ) {
        _world = world;
        _player = [[Player alloc] initWithWorld: world];
        
        CGSize screen = [[CCDirector sharedDirector] winSize];
        b2Vec2 centerVec = _player.body->GetLocalCenter();
        
        _player.body->SetTransform(b2Vec2((screen.width-(centerVec.x*PTM_RATIO/2))/2/PTM_RATIO,10/PTM_RATIO),0.0f);
        _player.body->SetFixedRotation(YES);
     //   [self schedule:@selector(acceleration:)];
        [_player activatePolygonCollisions];
        
        [self addChild:_player];
        
        self.isTouchEnabled = YES;
 //       [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
        isAccelerate = NO;
        
        _playerShiftDirection = DIRECTION_NONE;
        _touchShiftDistance = 0.0;
        _currentPlayerAngle = 0.0;
        
        [self scheduleUpdate];


    }
    
    return self;
}

- (void) acceleration:(ccTime) dt {
    b2Vec2 force = b2Vec2(_touchShiftDistance/10, 0.5f);
//    force.x=force.x*cos(_rotateAngle)-force.y*sin(_rotateAngle);
//    force.y=force.y*cos(_rotateAngle)+force.x*sin(_rotateAngle);
    _player.body->SetLinearVelocity(force);
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{

        
       // [self schedule:@selector(acceleration:)];
        
        _touchPrevious = _touchCurrent = [touch locationInView:[touch view]];
        _currentPlayerAngle = _player.body->GetAngle();
//    }
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (isAccelerate == NO) 
        isAccelerate = YES;
    
    _touchCurrent = [touch locationInView:[touch view]];
    CGPoint deltaPosition = ccpSub(_touchCurrent, _touchPrevious); //CGPointMake((_touchCurrent.x - _touchPrevious.x), (_touchCurrent.y-_touchPrevious.y));
    float deltaDistance = sqrt(deltaPosition.x*deltaPosition.x + deltaPosition.y*deltaPosition.y);
    
    deltaPosition = ccpNormalize(deltaPosition);
    
    _touchShiftDistance += (int)deltaPosition.x*(deltaDistance);
    if (fabs(_touchShiftDistance) > 45.0f)
        _touchShiftDistance = _playerShiftDirection == DIRECTION_RIGHT ? 45.0f:-45.0f;

    //else
   //     _touchShiftDistance = 15.0;
//    float ditanceDelta = distance - _currentDeltaPosition;
//    _currentDeltaPosition = distance;
//    _leftDirection = deltaPosition.x < 0 ? YES:NO;
    
    if (deltaPosition.x > 0)
        _playerShiftDirection = DIRECTION_RIGHT;
    else
        _playerShiftDirection = DIRECTION_LEFT;
        
    _touchPrevious = _touchCurrent;
    CCLOG(@"[%s:%f] deltaX: %f deltaY: %f\n", _playerShiftDirection == DIRECTION_RIGHT ? "RIGHT":"LEFT",
          _touchShiftDistance,
          deltaPosition.x, deltaPosition.y);
    
//    b2Vec2 pos = _player.body->GetPosition();
    
    float rotateAngle = _currentPlayerAngle + CC_DEGREES_TO_RADIANS(_touchShiftDistance);
    
    CCLOG(@"Body rotate angle: %f\n", CC_RADIANS_TO_DEGREES(rotateAngle));


}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (isAccelerate == YES) {
      //  [self unschedule:@selector(acceleration:)];
        isAccelerate = NO;
//        _touchShiftDistance = 0.0;
//        b2Vec2 center = _player.body->GetWorldCenter();// body centerpoint;
//        b2Vec2 force = b2Vec2(50, 0); // apply 50f to right
//        b2Vec2 point = b2Vec2(center.x, 0); // top-center point
//        _player.body->ApplyLinearImpulse(force, center);
//        _player.body->SetLinearDamping(20);

    }

}

-(void) update:(ccTime) dt {

    //    force.x=force.x*cos(_rotateAngle)-force.y*sin(_rotateAngle);
    //    force.y=force.y*cos(_rotateAngle)+force.x*sin(_rotateAngle);
    if (isAccelerate == NO && (_playerShiftDirection == DIRECTION_LEFT || _playerShiftDirection == DIRECTION_RIGHT)) {
        if (_touchShiftDistance == 0.0f)
            _playerShiftDirection = DIRECTION_NONE;
        
        if (_playerShiftDirection == DIRECTION_RIGHT) {
            if (_touchShiftDistance < 0)
                _touchShiftDistance = 0.0f;
            else
                _touchShiftDistance -= 2.0f;
        } else
        if ( _playerShiftDirection == DIRECTION_LEFT) {
            if (_touchShiftDistance > 0)
                _touchShiftDistance = 0.0f;
            else
                _touchShiftDistance += 2.0f;
        }

    }
    b2Vec2 force = b2Vec2(_touchShiftDistance/5, 5.5f);
    _player.body->SetLinearVelocity(force);
}

-(void) draw {

}

@end
