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

@interface PlayerManager : CCNode{
    b2World *_world;
    Player *_player;

@private
    CGPoint _velocity;
}

@property (assign, readwrite) Player *player;

-(id) initWithWorld:(b2World *)world;



@end
