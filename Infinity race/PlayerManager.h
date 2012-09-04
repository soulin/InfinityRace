//
//  PlayerManager.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "cocos2d.h"
#import "box2d.h"
#import "Player.h"

enum {
    DIRECTION_NONE = 0,
    DIRECTION_LEFT,
    DIRECTION_RIGHT
};

@interface PlayerManager : CCNode <CCTargetedTouchDelegate> {
    b2World *_world;
    Player *_player;

@private
    BOOL isAccelerate;
    CGPoint _touchCurrent, _touchPrevious;    
    int _playerShiftDirection;
    float _touchShiftDistance;
    
    float _currentPlayerAngle;
}

@property (assign, readwrite) Player *player;

-(id) initWithWorld:(b2World *)world;


@end
