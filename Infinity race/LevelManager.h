//
//  LevelManager.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "cocos2d.h"
#import "box2d.h"
#import "Rope.h"
#import "AnchorPoint.h"
#import "tdRope.h"


@class AsteroidManager;
@class PlayerManager;

@interface LevelManager : CCLayer {
    
    AsteroidManager *_asteroidManager;
    PlayerManager *_playerManager;
    
    bool _move;
    b2World *_world;
    CGPoint _playerDirection;
}

@property (nonatomic, readwrite) CGPoint playerDirection;

-(id) initWithWorld:(b2World *)world;
-(CGPoint) locationFromTouches:(NSSet *)touches;
-(void) moveToFlag:(bool) flag;
-(void) reloadLevel;
//-(void) update:(ccTime) dt;

@end
