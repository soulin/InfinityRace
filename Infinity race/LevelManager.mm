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
    if ((self = [super init])) {
    
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
        
        _tdRope = [[tdRope alloc] initWithWorld:world];
        
        [self scheduleUpdate];
        
        self.isTouchEnabled = YES;
        ropeCreated = NO;
    }
    
    return self;
}

-(void) update:(ccTime) dt
{
    [_rope update:dt];
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CCLOG(@"!!!!");
 /*   [_rope createRopeWithBodyA:_playerManager.player.body anchorA:_playerManager.player.body->GetLocalCenter()
                         bodyB:_anchorPoint.body anchorB:_anchorPoint.centroid
                         sag:1.1];
  */
    if (ropeCreated == NO) {
    
    [_tdRope createRopeWithBodyA:_playerManager.player.body anchorA:_playerManager.player.body->GetLocalCenter()
                           bodyB:_anchorPoint.body anchorB:_anchorPoint.centroid
                             sag:1.1];
        ropeCreated = YES;
    } else {
        [_tdRope destroyRope];
        ropeCreated = NO;
    }
}

@end
