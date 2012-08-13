//
//  tdRope.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 12.08.12.
//
//

#import "tdRope.h"

@implementation tdRope

-(id) initWithWorld:(b2World *) world {
        
    if (self = [super init]) {
        _world = world;
    }
    
    return self;
}

-(void) createRopeWithBodyA:(b2Body*)bodyA anchorA:(b2Vec2)anchorA
                      bodyB:(b2Body*)bodyB anchorB:(b2Vec2)anchorB
                        sag:(float32)sag
{
    b2RopeJointDef jd;
    jd.bodyA = bodyA;
    jd.bodyB = bodyB;
    jd.localAnchorA = anchorA;
    jd.localAnchorB = anchorB;

    
    // Max length of joint = current distance between bodies * sag
    float32 ropeLength = (bodyA->GetWorldPoint(anchorA) - bodyB->GetWorldPoint(anchorB)).Length() * sag;
    jd.maxLength = ropeLength;
    
    // Create joint
    _ropeJoint = (b2RopeJoint *)_world->CreateJoint(&jd);
    
    /*
    VRope *newRope = [[VRope alloc] initWithRopeJoint:ropeJoint spriteSheet:_ropeSpriteSheet];
    
    [_ropes addObject:newRope];
    [newRope release];
     */
}

-(void) destroyRope {
    _world->DestroyJoint(_ropeJoint);
}

-(void) dealloc {
    [super dealloc];
}

@end
