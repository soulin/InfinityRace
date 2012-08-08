//
//  RopeManager.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "Rope.h"

#import "VRope.h"

@implementation Rope

-(id) initWithFile:(NSString *) file andWorld:(b2World *) world{
    self = [super init];
     
    _ropes = [[NSMutableArray alloc] init];
    _ropeSpriteSheet = [CCSpriteBatchNode batchNodeWithFile:file];
    [self addChild:_ropeSpriteSheet];
    
    _world = world;
    

    
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
    b2RopeJoint *ropeJoint = (b2RopeJoint *)_world->CreateJoint(&jd);
    
    VRope *newRope = [[VRope alloc] initWithRopeJoint:ropeJoint spriteSheet:_ropeSpriteSheet];
    
    [_ropes addObject:newRope];
    [newRope release];
}

- (void) update:(ccTime) dt {
    // Update all the ropes
    for (VRope *rope in _ropes)
    {
        [rope update:dt];
        [rope updateSprites];
    }
}

-(void) dealloc {
    [_ropes release];
    [super dealloc];
}

@end
