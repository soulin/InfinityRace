//
//  AnchorPoint.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "AnchorPoint.h"

@implementation AnchorPoint

-(id)initWithWorld:(b2World *)world
{
    int32 count = 8;
    
    b2Vec2 vertices[] = {
        b2Vec2(5.0/PTM_RATIO,10.0/PTM_RATIO),
        b2Vec2(16.0/PTM_RATIO,6.0/PTM_RATIO),
        b2Vec2(32.0/PTM_RATIO,6.0/PTM_RATIO),
        b2Vec2(49.0/PTM_RATIO,13.0/PTM_RATIO),
        b2Vec2(61.0/PTM_RATIO,33.0/PTM_RATIO),
        b2Vec2(54.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(48.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(5.0/PTM_RATIO,20.0/PTM_RATIO)
    };
    
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    b2Body *body = [self createStaticBodyForWorld:world position:b2Vec2(screen.width/2/PTM_RATIO,screen.height/2/PTM_RATIO) rotation:0 vertices:vertices vertexCount:count density:5.0 friction:0.2 restitution:0.2];
    
    if ((self = [super initWithBody:body original:YES]))
    {
    }
    return self;
}


@end
