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
        
        _playeOffset = 50.0f;
        
        [_player activatePolygonCollisions];
        
        [self scheduleUpdate];
    }
    
    return self;
}

-(void) reinitPlayer {
    [_player setPolygonRotation:0.0f];
    [_player polygonSetAngularVelocity:0.0f];
    [_player polygonSetLinearVelocity:b2Vec2_zero];
    
    [self initPlayer];
}

-(void) initPlayer {
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    float x = 0.0;//screen.height/2;
    float y = screen.height/2;
    
    CCLOG(@"Screen position: x = %f y = %f", screen.height, screen.width);
    CCLOG(@"Player position: x = %f y = %f", x, y);

    [_player setPolygonPosition:ccp(x+_playeOffset, y)];
    _player.body->SetLinearDamping(0.2f);
}

/*
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
*/
-(void) movePlayer:(CGPoint) direction {
    b2Vec2 force = b2Vec2(direction.x, direction.y);
//    b2Vec2 currentVelocity = _player.body->GetLinearVelocity();
    _player.body->ApplyForceToCenter(force);


//    CCLOG(@"Current Linear Velocity: x = %f y = %f", currentVelocity.x, currentVelocity.y);
}

/*-(void) stopPlayer:(CGPoint) direction {
 //   b2Vec2 force = b2Vec2(direction.x, direction.y);
   // _player.body->ApplyForceToCenter(force);
   // b2Vec2 vel = _player.body->GetLinearVelocity();
   // if (direction.x == 0)
  //      _player.body->SetLinearVelocity(direction.x, vel.y)
//    b2Vec2 vel = _player.body->GetLinearVelocity();
//    CCLOG(@"Current Linear Velocity: x = %f y = %f", vel.x, vel.y);
}
*/

-(void) update:(ccTime) dt {

    
    
    //    force.x=force.x*cos(_rotateAngle)-force.y*sin(_rotateAngle);
    //    force.y=force.y*cos(_rotateAngle)+force.x*sin(_rotateAngle);
  /*  if (isAccelerate == NO && (_playerShiftDirection == DIRECTION_LEFT || _playerShiftDirection == DIRECTION_RIGHT)) {
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
    _player.body->SetLinearVelocity(force);*/
}

-(void) draw {

}

@end
