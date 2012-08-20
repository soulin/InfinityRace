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
        
        _anchorPoints = [[NSMutableArray alloc] init];
        
        _anchorPoint = [[AnchorPoint alloc] initWithWorld:world];
        [_anchorPoint activateCollisions];
        
        [_anchorPoints addObject:_anchorPoint];
       // [self addChild:_anchorPoint];
        
        _anchorPoint1 = [[AnchorPoint alloc] initWithWorld:world];
        [_anchorPoint1 activateCollisions];
        CGSize screen = [[CCDirector sharedDirector] winSize];
        _anchorPoint1.body->SetTransform(b2Vec2(screen.width/5.2/PTM_RATIO,screen.height/6.4/PTM_RATIO), 0);
        [_anchorPoints addObject:_anchorPoint1];
        
    //   [_anchorPoint1 setPosition:ccp(screen.width/1.6/PTM_RATIO,screen.height/1.2/PTM_RATIO)];
       // [self addChild:_anchorPoint1];
    
        _rope = [[Rope alloc] initWithFile:@"rope.png" andWorld:world];
        [self addChild:_rope];
        
        _tdRope = [[tdRope alloc] initWithWorld:world];
        
        [self scheduleUpdate];
        
        _button = [[tsControlSpriteButton alloc] init];
        _button.position = CGPointMake(screen.width, 32);
        _button.button = [[tsControlButton alloc] initWithRect:CGRectMake(0, 0, 64, 64)];
        _button.button.radius = 32.0f;
        _button.defaultSprite = [CCSprite spriteWithFile:@"button-close.png"];
        _rightButton = [_button.button retain];
        _button.defaultSprite.visible = YES;
        [self addChild:_button];
        
        self.isTouchEnabled = YES;
        ropeCreated = NO;
    }
    
    return self;
}

-(void) dealloc {
    [_anchorPoints release];
    [super dealloc];
}


-(void) update:(ccTime) dt
{

    //ccpDistance
    [_rope update:dt];
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 //   CCLOG(@"!!!!");
 /*   [_rope createRopeWithBodyA:_playerManager.player.body anchorA:_playerManager.player.body->GetLocalCenter()
                         bodyB:_anchorPoint.body anchorB:_anchorPoint.centroid
                         sag:1.1];
  *
    CGPoint playerPosition = [_playerManager.player getPosition];
    CCLOG(@"Player position: (%f, %f)\n", playerPosition.x, playerPosition.y);
    int count = 0;
    for(AnchorPoint *anchor in _anchorPoints) {
        CGPoint anchorPosition = [anchor getPosition];
        float distance = ccpDistance(playerPosition, anchorPosition);
        CCLOG(@"\tDistance: %f\n", distance/PTM_RATIO);
        count++;
        
        if (distance/PTM_RATIO <= 5) {
            if (ropeCreated == NO) {
            
                [_tdRope createRopeWithBodyA:_playerManager.player.body anchorA:_playerManager.player.body->GetLocalCenter()
                                       bodyB:anchor.body anchorB:anchor.body->GetLocalCenter()
                                         sag:1.1];
                ropeCreated = YES;
            } else {
                [_tdRope destroyRope];
                ropeCreated = NO;
            }
        }

    }
  */
}

@end
