//
//  LevelManager.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "LevelManager.h"
#import "AsteroidManager.h"
#import "PlayerManager.h"
#import "InterfaceLayer.h"

@implementation LevelManager

-(id) initWithWorld:(b2World *)world
{
    if ((self = [super init])) {
        
        _asteroidManager = [[AsteroidManager alloc] initWithWorld:world];
        
        _asteroidManager.speed = 1.0f;
        
        [self addChild:_asteroidManager];
        [self scheduleUpdate];
        
        _playerManager = [[PlayerManager alloc] initWithWorld: world];
        [self addChild:_playerManager];
        
        _interfaceLayer = [[InterfaceLayer alloc] init];
        [self addChild:_interfaceLayer];
        
        
    
    //    self.isTouchEnabled = YES;
//                [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
//        _playerManager = [[PlayerManager alloc] initWithWorld: world];
//        [self addChild:_playerManager];
//        
//        _anchorPoints = [[NSMutableArray alloc] init];
//        
//        _anchorPoint = [[AnchorPoint alloc] initWithWorld:world];
//        [_anchorPoint activateCollisions];
//        
//        [_anchorPoints addObject:_anchorPoint];
//       // [self addChild:_anchorPoint];
//        
//        _anchorPoint1 = [[AnchorPoint alloc] initWithWorld:world];
//        [_anchorPoint1 activateCollisions];
//        CGSize screen = [[CCDirector sharedDirector] winSize];
//        _anchorPoint1.body->SetTransform(b2Vec2(screen.width/5.2/PTM_RATIO,screen.height/6.4/PTM_RATIO), 0);
//        [_anchorPoints addObject:_anchorPoint1];
//        
//    //   [_anchorPoint1 setPosition:ccp(screen.width/1.6/PTM_RATIO,screen.height/1.2/PTM_RATIO)];
//       // [self addChild:_anchorPoint1];
//    
//        _rope = [[Rope alloc] initWithFile:@"rope.png" andWorld:world];
//        [self addChild:_rope];
//        
//        _tdRope = [[tdRope alloc] initWithWorld:world];
//        
//        [self scheduleUpdate];
//        
//        _button = [[tsControlSpriteButton alloc] init];
//        _button.position = CGPointMake(screen.width, 32);
//        _button.button = [[tsControlButton alloc] initWithRect:CGRectMake(0, 0, 64, 64)];
//        _button.button.radius = 32.0f;
//        _button.defaultSprite = [CCSprite spriteWithFile:@"button-close.png"];
//        _rightButton = [_button.button retain];
//        _button.defaultSprite.visible = YES;
//        [self addChild:_button];
//        
//        self.isTouchEnabled = YES;
//        ropeCreated = NO;
    }
    
    return self;
}

-(void) dealloc {
//    [_anchorPoints release];
    [_asteroidManager release];
    [super dealloc];
}


-(CGPoint) locationFromTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    return [[CCDirector sharedDirector] convertToGL:touchLocation];
}

-(void) registerWithTouchDispatcher
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:NO];
}

-(void) update:(ccTime) dt
{
    
    if ([_interfaceLayer isButtonPressed]) {
        CCLOG(@"Button Pressed");
    }
    
    if ([_interfaceLayer isButtonClicked]) {
        CCLOG(@"Button Clicked");
        [_interfaceLayer resetButtonState];
        
    }
//    CGPoint myPosition = super.position;
//
//    myPosition.x -= 1;
//    [self setPosition:myPosition];
//    self.parent.position = myPosition;
//    NSLog(@"!y= %f", super.position.y);
//    if (_rightButton.status == BUTTON_STATE_CLICKED) {
//        _rightButton.status = BUTTON_STATE_NONE;
//        float angle = _playerManager.player.body->GetAngle();
//        CGSize screen = [[CCDirector sharedDirector] winSize];
//        b2Vec2 centerVec = _playerManager.player.body->GetLocalCenter();
//
//        
//        _playerManager.player.body->SetTransform(b2Vec2((screen.width-(centerVec.x*PTM_RATIO/2))/2/PTM_RATIO,100/PTM_RATIO),angle);
//    }
//
//    //ccpDistance
//    [_rope update:dt];
}

-(BOOL) ccTouchBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    CCLOG(@"!!!!");
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
    return YES;
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    CCLOG(@"asdasd");
    [self.parent runAction:[CCMoveBy actionWithDuration:.5 position:ccp(0,-100)]];
                      
//    CGPoint myPosition = self.parent.position;
//    
//    myPosition.y -= 100;
//    self.parent.position = myPosition;
//    
}

@end
