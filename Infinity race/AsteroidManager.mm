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
        
            CGSize screen = [[CCDirector sharedDirector] winSize];
            
            float x = [self randomValueBetween:20 andValue:screen.width-20];
            float y = [self randomValueBetween:screen.height/2 andValue:screen.height];
            NSLog(@"position x: %f y: %f \n", x,y);
            
            [asteroid setPolygonPosition:ccp(x, y)];
            [asteroid activatePolygonCollisions];
            [asteroid setPolygonRotation:90];
        
            [asteroid setPolygonDensity:5.0f];
            [asteroid setPolygonFriction:0.2];
            [asteroid setPolygonRestitution:0.2];
        
        
            [asteroid polygonCenterOfMassAlignWithShape];
            [asteroid polygonSetAngularVelocity:[self randomValueBetween:0.5 andValue:2]];
            //        NSLog(@"Random %f\n", (float)(arc4random() % 200)/100);

         //   [_asteroid polygonApplyLinearImpulse:b2Vec2(0.0f,-(float)(arc4random() % 200)/100)];
        
            [self addChild:asteroid];
            [_asteroids addObject:asteroid];
        }
        
        _speed = 0.0f;
        
        [self scheduleUpdate];
    }
    
    return self;
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
    int i = 0;
    for (Asteroid *asteroid in _asteroids) {
        NSLog(@"y= %f\n", [asteroid getPolygonPosition].y);
        i++;
    // CGPoint astPos = [asteroid getPolygonPosition];
    //    astPos.y -= 1;
        
     //   [asteroid polygonApplyForceToCenter:b2Vec2(0.0,-2.0)];
    }
/*    CGPoint pos = [self position];
    pos.y += 10;
    [self setPosition:pos];
 */
}
@end