//
//  LevelManager.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "cocos2d.h"
#import "box2d.h"
#import "PlayerManager.h"
#import "Rope.h"
#import "AnchorPoint.h"
#import "tdRope.h"
#import "tsControlButton.h"
#import "tsControlSpriteButton.h"

@class AsteroidManager;

@interface LevelManager : CCLayer {
    
    AsteroidManager *_asteroidManager;
//    PlayerManager *_playerManager;
//    NSMutableArray *_anchorPoints;
//    
//    AnchorPoint *_anchorPoint;
//    AnchorPoint *_anchorPoint1;
//    
//    Rope *_rope;
//    tdRope *_tdRope;
//    BOOL ropeCreated;
//    
//    tsControlSpriteButton *_button;
//    tsControlButton *_rightButton;
//    
}

-(id) initWithWorld:(b2World *)world;
-(CGPoint) locationFromTouches:(NSSet *)touches;
//-(void) update:(ccTime) dt;

@end
