//
//  Player.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.08.12.
//
//

#import "Player.h"

@implementation Player

-(id)initWithWorld:(b2World *)world
{
    int32 count = 3;

    b2Vec2 vertices[] = {
        b2Vec2(0.0/PTM_RATIO,0.0/PTM_RATIO),
        b2Vec2(25.0/PTM_RATIO,0.0/PTM_RATIO),
        b2Vec2(12.5/PTM_RATIO,25.0/PTM_RATIO)
//        b2Vec2(24.0/PTM_RATIO,6.0/PTM_RATIO),
//        b2Vec2(30.0/PTM_RATIO,16.0/PTM_RATIO),
//        b2Vec2(27.0/PTM_RATIO,30.0/PTM_RATIO),
//        b2Vec2(29.0/PTM_RATIO,30.0/PTM_RATIO),
//        b2Vec2(2.0/PTM_RATIO,10.0/PTM_RATIO)
    };

    CGSize screen = [[CCDirector sharedDirector] winSize];

    b2Body *body = [self createDynamicBodyForWorld:world position:b2Vec2(screen.width/2/PTM_RATIO,screen.height/PTM_RATIO) rotation:0 vertices:vertices vertexCount:count density:5.0 friction:0.2 restitution:0.2];
    
    if ((self = [super initWithBody:body original:YES]))
    {
    }
    
    return self;
}

@end
