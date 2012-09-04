//
//  Asteroid.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 30.08.12.
//
//

#import "Asteroid.h"

@implementation Asteroid

-(id)initWithWorld:(b2World *)world
{
    int32 count = 8;
    
    b2Vec2 vertices[] = {
        b2Vec2(2.5/PTM_RATIO,5.0/PTM_RATIO),
        b2Vec2(8.0/PTM_RATIO,3.0/PTM_RATIO),
        b2Vec2(16.0/PTM_RATIO,3.0/PTM_RATIO),
        b2Vec2(24.5/PTM_RATIO,7.5/PTM_RATIO),
        b2Vec2(30.5/PTM_RATIO,16.5/PTM_RATIO),
        b2Vec2(27.0/PTM_RATIO,30.0/PTM_RATIO),
        b2Vec2(24.0/PTM_RATIO,30.0/PTM_RATIO),
        b2Vec2(2.5/PTM_RATIO,10.0/PTM_RATIO)
    };
    
    
    b2Body *body = [self createDynamicBodyForWorld:world position:b2Vec2(0.0f, 0.0f) rotation:0 vertices:vertices vertexCount:count density:0.0 friction:0.0 restitution:0.0];
    

    if ((self = [super initWithBody:body original:YES])) {

    }
    
    return self;
}


@end
