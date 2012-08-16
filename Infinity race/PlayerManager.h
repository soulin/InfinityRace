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


@interface PlayerManager : CCNode <CCTargetedTouchDelegate> {
    b2World *_world;
    Player *_player;
}

@property (assign, readwrite) Player *player;

-(id) initWithWorld:(b2World *)world;


@end
