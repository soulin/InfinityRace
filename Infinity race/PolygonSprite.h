//
//  PolygonSprite.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 07.08.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "box2d.h"
#import "GLES-Render.h"

#define PTM_RATIO 32

@interface PolygonSprite: CCNode {

    b2Body *_body;
    BOOL _original;
    b2Vec2 _centroid;

}

@property(nonatomic,assign)b2Body *body;
@property(nonatomic,readwrite)BOOL original;
@property(nonatomic,readwrite)b2Vec2 centroid;

-(id)initWithBody:(b2Body*)body original:(BOOL)original;
-(id)initWithWorld:(b2World *)world;

-(b2Body*)createDynamicBodyForWorld:(b2World*)world position:(b2Vec2)position rotation:(float)rotation vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density friction:(float)friction restitution:(float)restitution;
-(b2Body*)createStaticBodyForWorld:(b2World*)world position:(b2Vec2)position rotation:(float)rotation vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density friction:(float)friction restitution:(float)restitution;

-(void)activatePolygonCollisions;
-(void)deactivatePolygonCollisions;
-(void) setPolygonPosition:(CGPoint)position;
-(CGPoint) getPolygonPosition;
-(void) setPolygonDensity:(float32) density;
-(float32) getPolygonDensity;
-(void) setPolygonFriction:(float32) friction;
-(float32) getPolygonFriction;
-(void) setPolygonRestitution:(float32) restitution;
-(float32) getPolygonRestitution;
-(void) setPolygonRotation:(float32)angle;
-(float32) getPolygonRotation;
-(void) polygonApplyForceToCenter:(b2Vec2) force;
-(void) polygonApplyForce:(b2Vec2) force toPoint:(b2Vec2) point;
-(void) polygonApplyLinearImpulse:(b2Vec2) impulse;
-(void) polygonSetAngularVelocity:(float32) velocity;
-(void) polygonSetLinearVelocity:(b2Vec2) velocity;
-(void) polygonCenterOfMassAlignWithShape;
-(void) polygonCenterOfMassAlignWith:(b2Vec2) center;
-(void) polygonCenterOfMassReset;
-(float) getPolygonMass;
-(void) setPolygonMass:(float) mass;

@end