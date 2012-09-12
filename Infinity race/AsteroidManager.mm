//
//  AsteroidManager.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 02.09.12.
//
//

#import "AsteroidManager.h"
#import "Asteroid.h"

@implementation AsteroidManager

@synthesize speed = _speed;

- (float)randomValueBetween:(float)low andValue:(float)high {
    return (((float) arc4random() / 0xFFFFFFFFu) * (high - low)) + low;
}

-(id) initWithWorld:(b2World *)world
{
    if (self = [super init] ) {
        _asteroids = [[NSMutableArray alloc] init];
        for (int i = 0; i<1; i++ ) {
            Asteroid *asteroid = [[Asteroid alloc] initWithWorld:world];
            
            [self addChild:asteroid];
            [_asteroids addObject:asteroid];
        }
        
        [self scheduleUpdate];
    }
    
    return self;
}

-(void) reinitAsteroids {
    for (Asteroid *asteroid in _asteroids) {
        [asteroid setPolygonRotation:0.0f];
        [asteroid polygonSetAngularVelocity:0.0f];
        [asteroid polygonSetLinearVelocity:b2Vec2_zero];
        
        [self initAsteroids];
    }
}

-(void) initAsteroids {
    for (Asteroid *asteroid in _asteroids) {
        CGSize screen = [[CCDirector sharedDirector] winSize];
        
        float x = screen.width/2;
        float y = screen.height/2;
        CCLOG(@"Asteroid position x: %f y: %f \n", x,y);
        
        [asteroid setPolygonPosition:ccp(x, y)];
        [asteroid activatePolygonCollisions];
        [asteroid setPolygonRotation:90];
        
        [asteroid setPolygonDensity:5.0f];
        [asteroid setPolygonFriction:0.2];
        [asteroid setPolygonRestitution:0.2];
        
        
        [asteroid polygonCenterOfMassAlignWithShape];
        [asteroid polygonSetAngularVelocity:[self randomValueBetween:0.5 andValue:2]];
        [asteroid setPolygonMass:20.0f];
    }
}

-(void) dealloc
{
    //[_asteroid release];
    [_asteroids removeAllObjects];
    [_asteroids release];
    
    [super dealloc];
}

-(void) update:(ccTime) dt
{
/*    int i = 0;
    for (Asteroid *asteroid in _asteroids) {
        NSLog(@"y= %f\n", [asteroid getPolygonPosition].y);
        i++;
    // CGPoint astPos = [asteroid getPolygonPosition];
    //    astPos.y -= 1;
        
     //   [asteroid polygonApplyForceToCenter:b2Vec2(0.0,-2.0)];
    }*/
/*    CGPoint pos = [self position];
    pos.y += 10;
    [self setPosition:pos];
 */
}
@end
