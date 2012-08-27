//
//  SceneManager.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 23.08.12.
//
//

#import "CCLayer.h"
#import "box2d.h"

@class LevelManager;
@class PlayerManager;

@interface SceneManager : CCLayer {

@private
    LevelManager *_levelManger;
    PlayerManager *_playerManager;
}

-(id) initWithWorld:(b2World *)world;

@end
