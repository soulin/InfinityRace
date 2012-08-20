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
        
        [self schedule:@selector(acceleration:)];
        
         _touchPrevious = _touchCurrent = [touch locationInView:[touch view]];
    }
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (isAccelerate == YES) {
        [self unschedule:@selector(acceleration:)];
        isAccelerate = NO;
        
    }
}

@end
