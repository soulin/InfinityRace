//
//  PlayerManager.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "cocos2d.h"
#import "Box2D.h"
#import "Player.h"


@interface PlayerManager : CCNode <CCTargetedTouchDelegate> {
    b2World *_world;
    Player *_player;
}

-(id) initWithWorld:(b2World *)world;

@end
