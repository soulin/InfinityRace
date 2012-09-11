//
//  PolygonSprite.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 07.08.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PolygonSprite.h"

@implementation PolygonSprite

@synthesize original = _original;
@synthesize body = _body;
@synthesize centroid = _centroid;

-(id)initWithBody:(b2Body*)body original:(BOOL)original
{
    // gather all the vertices from our Box2D shape
    b2Fixture *originalFixture = body->GetFixtureList();
    b2PolygonShape *shape = (b2PolygonShape*)originalFixture->GetShape();
    int vertexCount = shape->GetVertexCount();
    NSMutableArray *points = [NSMutableArray arrayWithCapacity:vertexCount];
    for(int i = 0; i < vertexCount; i++) {
        CGPoint p = ccp(shape->GetVertex(i).x * PTM_RATIO, shape->GetVertex(i).y * PTM_RATIO);
        [points addObject:[NSValue valueWithCGPoint:p]];
    }
    
    if ((self = [super init]))
    {
        _body = body;
        _body->SetUserData(self);
        _original = original;
        // gets the center of the polygon
        _centroid = self.body->GetLocalCenter();
        // assign an anchor point based on the center
//        self.anchorPoint = ccp(_centroid.x * PTM_RATIO / texture.contentSize.width,
//                               _centroid.y * PTM_RATIO / texture.contentSize.height);
    }
    return self;
}

-(id)initWithWorld:(b2World *)world {
    return nil;
}

-(b2Body*)createStaticBodyForWorld:(b2World*)world position:(b2Vec2)position rotation:(float)rotation
                          vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density
                          friction:(float)friction restitution:(float)restitution
{
    b2BodyDef bodyDef;
    bodyDef.type = b2_staticBody;
    bodyDef.position = position;
    bodyDef.angle = rotation;
    b2Body *body = world->CreateBody(&bodyDef);
    
    b2FixtureDef fixtureDef;
    fixtureDef.density = density;
    fixtureDef.friction = friction;
    fixtureDef.restitution = restitution;
    fixtureDef.filter.categoryBits = 0;
    fixtureDef.filter.maskBits = 0;
    fixtureDef.isSensor = NO;
    
    b2PolygonShape shape;
    shape.Set(vertices, count);
    fixtureDef.shape = &shape;
    body->CreateFixture(&fixtureDef);

    
    return body;

}

-(b2Body*)createDynamicBodyForWorld:(b2World*)world position:(b2Vec2)position rotation:(float)rotation
                    vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density
                    friction:(float)friction restitution:(float)restitution
{
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position = position;
    bodyDef.angle = rotation;
    bodyDef.fixedRotation = NO;
    b2Body *body = world->CreateBody(&bodyDef);
    
    b2FixtureDef fixtureDef;
    fixtureDef.density = density;
    fixtureDef.friction = friction;
    fixtureDef.restitution = restitution;
    fixtureDef.filter.categoryBits = 0;
    fixtureDef.filter.maskBits = 0;
    fixtureDef.isSensor = NO;
    
    b2PolygonShape shape;
    shape.Set(vertices, count);
    fixtureDef.shape = &shape;
    body->CreateFixture(&fixtureDef);
    
    return body;
}

-(void)activatePolygonCollisions
{
    b2Fixture *fixture = _body->GetFixtureList();
    b2Filter filter = fixture->GetFilterData();
    filter.categoryBits = 0x0001;
    filter.maskBits = 0x0001;
    fixture->SetFilterData(filter);
}

-(void)deactivatePolygonCollisions
{
    b2Fixture *fixture = _body->GetFixtureList();
    b2Filter filter = fixture->GetFilterData();
    filter.categoryBits = 0;
    filter.maskBits = 0;
    fixture->SetFilterData(filter);
}

-(void) setPolygonPosition:(CGPoint)position {
    _body->SetTransform(b2Vec2(position.x/PTM_RATIO,position.y/PTM_RATIO),0.0f);
}

-(CGPoint) getPolygonPosition {
    b2Vec2 pos = _body->GetPosition();
    return ccp(pos.x*PTM_RATIO, pos.y*PTM_RATIO);
}

-(void) setPolygonDensity:(float32) density {
    b2Fixture *fixture = _body->GetFixtureList();
    fixture->SetDensity(density);
}

-(float32) getPolygonDensity {
    b2Fixture *fixture = _body->GetFixtureList();
    return fixture->GetDensity();
}

-(void) setPolygonFriction:(float32) friction {
    b2Fixture *fixture = _body->GetFixtureList();
    fixture->SetFriction(friction);
}

-(float32) getPolygonFriction {
    b2Fixture *fixture = _body->GetFixtureList();
    return fixture->GetFriction();
}

-(void) setPolygonRestitution:(float32) restitution {
    b2Fixture *fixture = _body->GetFixtureList();
    fixture->SetRestitution(restitution);
}

-(float32) getPolygonRestitution {
    b2Fixture *fixture = _body->GetFixtureList();
    return fixture->GetRestitution();
}

-(void) setPolygonRotation:(float32)angle {
    b2Vec2 pos = _body->GetPosition();
    
    _body->SetTransform(pos, CC_DEGREES_TO_RADIANS(angle));
}

-(float32) getPolygonRotation {
    return _body->GetAngle();
}

-(void) polygonApplyForceToCenter:(b2Vec2) force {
    _body->ApplyForceToCenter(force);
}

-(void) polygonApplyForce:(b2Vec2) force toPoint:(b2Vec2) point {
    _body->ApplyForce(force, point);
}

-(void) polygonApplyLinearImpulse:(b2Vec2) impulse {
    _body->ApplyLinearImpulse(impulse, _body->GetWorldCenter());
    
}

-(void) polygonSetAngularVelocity:(float32) impulse {
    _body->SetAngularVelocity(impulse);
}

-(void) polygonCenterOfMassAlignWithShape {
    b2MassData massD;
    _body->GetMassData(&massD);
    
    b2Fixture *fixture = _body->GetFixtureList();
    b2PolygonShape *shape = (b2PolygonShape *)fixture->GetShape();
    b2Vec2 centroid = shape->m_centroid;
    massD.center = centroid;
    
    _body->SetMassData(&massD);
}

-(void) polygonCenterOfMassAlignWith:(b2Vec2) center {
    b2MassData massD;
    _body->GetMassData(&massD);
    
    massD.center = center;
    
    _body->SetMassData(&massD);
}

-(void) polygonCenterOfMassReset {
    b2MassData massD;
    _body->GetMassData(&massD);
    
    massD.center = b2Vec2(0.0, 0.0);
    
    _body->SetMassData(&massD);

}

-(float) getPolygonMass {
    b2MassData massD;
    _body->GetMassData(&massD);
    
    return massD.mass;
}

-(void) setPolygonMass:(float) mass {
    b2MassData massD;
    _body->GetMassData(&massD);
    
    massD.mass = mass;
    massD.I = 30.0;
    
    _body->SetMassData(&massD);
}


-(void)draw
{
/*    
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    b2Vec2 position = _body->GetPosition();
    
    ccDrawCircle(ccp(position.x, position.y), 20, 360, 30, false);
  */  
    [super draw];
}



@end
