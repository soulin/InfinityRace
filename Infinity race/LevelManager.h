//
//  LevelManager.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "cocos2d.h"
#import "CCLayer.h"
#import "box2d.h"
#import "PlayerManager.h"
#import "Rope.h"
#import "AnchorPoint.h"

@interface LevelManager : CCLayer {
    PlayerManager *_playerManager;
    AnchorPoint *_anchorPoint;
    AnchorPoint *_anchorPoint1;
    
    Rope *_rope;
}

-(id) initWithWorld:(b2World *)world;
-(void) update:(ccTime) dt;

@end
