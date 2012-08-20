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
  //  body->SetAwake(NO);
    
    return body;
}

-(void)activateCollisions
{
    b2Fixture *fixture = _body->GetFixtureList();
    b2Filter filter = fixture->GetFilterData();
    filter.categoryBits = 0x0001;
    filter.maskBits = 0x0001;
    fixture->SetFilterData(filter);
}

-(void)deactivateCollisions
{
    b2Fixture *fixture = _body->GetFixtureList();
    b2Filter filter = fixture->GetFilterData();
    filter.categoryBits = 0;
    filter.maskBits = 0;
    fixture->SetFilterData(filter);
}

-(CGPoint) getPosition
{
    b2Vec2 position = _body->GetPosition();
    return ccp(position.x*PTM_RATIO, position.y*PTM_RATIO);
}

-(void)draw
{
    glEnable(GL_BLEND);
     glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    // glCo;
    
    //    ccDrawCircle(mySprite.position, attackRange, 360, 30, false);
    b2Vec2 position = _body->GetPosition();
    
    ccDrawCircle(ccp(position.x, position.y), 20, 360, 30, false);
    
    [super draw];
    
}


//-(void)setPosition:(CGPoint) position {
//    [super setPosition:position];
//    _body->SetTransform(b2Vec2(position.x, position.y), 0);
//}

@end
