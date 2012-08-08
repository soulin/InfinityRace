//
//  RopeManager.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "CCNode.h"
#import "box2d.h"
#import "cocos2d.h"

@interface Rope : CCNode {
    NSMutableArray *_ropes;
    CCSpriteBatchNode *_ropeSpriteSheet;
    
    b2World *_world;
}

-(id) initWithFile:(NSString *) file andWorld:(b2World *) world;

-(void) createRopeWithBodyA:(b2Body*)bodyA anchorA:(b2Vec2)anchorA
                      bodyB:(b2Body*)bodyB anchorB:(b2Vec2)anchorB
                        sag:(float32)sag;

- (void) update:(ccTime) dt;

@end
