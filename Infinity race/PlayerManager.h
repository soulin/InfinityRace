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


@interface PlayerManager : CCLayer {//CCNode <CCTargetedTouchDelegate> {
    b2World *_world;
    Player *_player;

@private
    BOOL isAccelerate;
    CGPoint _touchCurrent, _touchPrevious;
}

@property (assign, readwrite) Player *player;

-(id) initWithWorld:(b2World *)world;


@end
