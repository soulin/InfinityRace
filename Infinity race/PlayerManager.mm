//
//  PlayerManager.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "PlayerManager.h"


@implementation PlayerManager

//@synthesize player = _player;

-(id) initWithWorld:(b2World *)world
{
    if (self = [super init] ) {
        _world = world;
        _player = [[Player alloc] initWithWorld: world];
        [_player activateCollisions];
    }
    
    return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

@end
