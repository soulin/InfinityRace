//
//  AsteroidManager.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 02.09.12.
//
//

#import "CCNode.h"
#import "box2d.h"

@class Asteroid;

@interface AsteroidManager : CCNode {
    NSMutableArray *_asteroids;
    float _speed;
//    Asteroid *_asteroid;
}

@property (nonatomic, readwrite) float speed;

-(id) initWithWorld:(b2World *)world;
-(float) randomValueBetween:(float)low andValue:(float)high;

@end
