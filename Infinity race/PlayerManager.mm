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
        
        _player.body->SetTransform(b2Vec2((screen.width-(centerVec.x*PTM_RATIO/2))/2/PTM_RATIO,10/PTM_RATIO), 0);
        _player.body->SetFixedRotation(YES);
                                 
        [_player activateCollisions];
        
        [self addChild:_player];
        
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
        isAccelerate = NO;
    }
    
    return self;
}

- (void) acceleration:(ccTime) dt {

    _player.body->ApplyForceToCenter(b2Vec2(0.0, 250.0f));
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (isAccelerate == NO) {
        isAccelerate = YES;
        
       // [self schedule:@selector(acceleration:)];
        
         _touchPrevious = _touchCurrent = [touch locationInView:[touch view]];
    }
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    _touchCurrent = [touch locationInView:[touch view]];
    CGPoint deltaPosition = ccpSub(_touchCurrent, _touchPrevious); //CGPointMake((_touchCurrent.x - _touchPrevious.x), (_touchCurrent.y-_touchPrevious.y));
    float distance = sqrt(deltaPosition.x*deltaPosition.x + deltaPosition.y*deltaPosition.y);
    CGPoint normalVector = ccpNormalize(deltaPosition);
    CGPoint directionVector = ccp(0.0, 200.0);
    CGPoint turnVector = ccp(deltaPosition.x, 0);
    CGPoint sumVector = ccpAdd(directionVector, turnVector);
    float angleRads = ccpToAngle(sumVector);
    float angle = CC_RADIANS_TO_DEGREES(angleRads);
    
    BOOL leftDirection = deltaPosition.x < 0 ? YES:NO;
    b2Vec2 pos = _player.body->GetPosition();
    //b2Vec2 pos = ccpAdd(_player.body->GetPosition(), _player.body->GetLocalCenter());
    _player.body->SetTransform(pos, CC_DEGREES_TO_RADIANS(90) - angleRads);
    CCLOG(@"Direction: %s - Delta position: %f , Rotation angle(rads): %f(%f)\n", leftDirection == YES? "LEFT":"RIGHT", distance, angle, angleRads);
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (isAccelerate == YES) {
        [self unschedule:@selector(acceleration:)];
        isAccelerate = NO;
        
    }
}

@end
