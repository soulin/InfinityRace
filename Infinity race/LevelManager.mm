//
//  LevelManager.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "LevelManager.h"

@implementation LevelManager

-(id) initWithWorld:(b2World *)world
{
    [super init];
    
    _playerManager = [[PlayerManager alloc] initWithWorld: world];
    [self addChild:_playerManager];
    
    _anchorPoint = [[AnchorPoint alloc] initWithWorld:world];
    [_anchorPoint activateCollisions];
    [self addChild:_anchorPoint];
    
    _anchorPoint1 = [[AnchorPoint alloc] initWithWorld:world];
    [_anchorPoint1 activateCollisions];
    CGSize screen = [[CCDirector sharedDirector] winSize];
    _anchorPoint1.body->SetTransform(b2Vec2(screen.width/3.2/PTM_RATIO,screen.height/3.4/PTM_RATIO), 0);
    //   [_anchorPoint1 setPosition:ccp(screen.width/1.6/PTM_RATIO,screen.height/1.2/PTM_RATIO)];
    [self addChild:_anchorPoint1];
    
    _rope = [[Rope alloc] initWithFile:@"rope.png" andWorld:world];
    [self addChild:_rope];
    
    return self;
}

-(void) update:(ccTime) dt
{
    [_rope update:dt];
}

@end
