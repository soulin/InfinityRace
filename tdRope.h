//
//  tdRope.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 12.08.12.
//
//

#import <Foundation/Foundation.h>
#import "Box2D.h"

@interface tdRope : NSObject {
    int _ropePoints;
    b2RopeJoint *_ropeJoint;
    
    b2World *_world;
    
}

-(id) initWithWorld:(b2World *) world;
-(void) createRopeWithBodyA:(b2Body*)bodyA anchorA:(b2Vec2)anchorA
                      bodyB:(b2Body*)bodyB anchorB:(b2Vec2)anchorB
                        sag:(float32)sag;
-(void) destroyRope;

@end
