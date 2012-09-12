//
//  LevelScene.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.09.12.
//
//

#import "LevelScene.h"
#import "LevelManager.h"
#import "InterfaceLayer.h"

@implementation LevelScene

@synthesize interfaceLayer = _interfaceLayer;
+(id) scene {
    CCScene *scene = [CCScene node];
    
    InterfaceLayer* interfaceLayer = [InterfaceLayer node];
    [scene addChild:interfaceLayer z:1];
    
    LevelScene* levelScene = [LevelScene node];//[[[LevelScene alloc] initWithHUD:interfaceLayer] autorelease];
    [scene addChild:levelScene];
    
    levelScene.interfaceLayer = interfaceLayer;
   
    return scene;
}

-(void) onEnter {
    [super onEnter];
    
    CCLOG(@"onEnter");
    _levelLayer = [[LevelManager alloc] initWithWorld:_world];
    [self addChild:_levelLayer];
    
}

//-(id) initWithHUD:(InterfaceLayer *) interface
-(id) init
{
    if ((self = [super init])) {
     //   _interfaceLayer = interface;
        
        [self initPhysics];
        
      
        [self scheduleUpdate];
    }
    
    return self;
}

-(void) initPhysics
{
	
	//CGSize s = [[CCDirector sharedDirector] winSize];
	
	b2Vec2 gravity;
	gravity.Set(0.0f, 0.0f);
	_world = new b2World(gravity);
	
	
	// Do we want to let bodies sleep?
	_world->SetAllowSleeping(true);
	
	_world->SetContinuousPhysics(true);
	
	_m_debugDraw = new GLESDebugDraw( PTM_RATIO );
	_world->SetDebugDraw(_m_debugDraw);
	
	uint32 flags = 0;
	flags += b2Draw::e_shapeBit;
    flags += b2Draw::e_jointBit;
	//		flags += b2Draw::e_aabbBit;
	//		flags += b2Draw::e_pairBit;
    flags += b2Draw::e_centerOfMassBit;
	_m_debugDraw->SetFlags(flags);
}

-(void) draw
{
	//
	// IMPORTANT:
	// This is only for debug purposes
	// It is recommend to disable it
	//
	[super draw];
	
	ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position );
	
	kmGLPushMatrix();
	
	_world->DrawDebugData();
	
	kmGLPopMatrix();
}


-(void) update:(ccTime) dt
{
    int32 velocityIterations = 8;
	int32 positionIterations = 1;
	
	// Instruct the world to perform a single step of simulation. It is
	// generally best to keep the time step and iterations fixed.
	_world->Step(dt, velocityIterations, positionIterations);
    
    for (b2Body* b = _world->GetBodyList(); b; b = b->GetNext())
    {
    }
    
    if ([_interfaceLayer isResetButtonClicked]) {
        [_levelLayer reloadLevel];
        [_interfaceLayer resetButtonState];
    }
    
    if ([_interfaceLayer isUpButtonPressed]) {
        CCLOG(@"Up Button Pressed");
        _levelLayer.playerDirection = ccp(_levelLayer.playerDirection.x, 1.0f);
    }
    else
    if ([_interfaceLayer isDownButtonPressed]) {
        CCLOG(@"Down Button Pressed");
        _levelLayer.playerDirection = ccp(_levelLayer.playerDirection.x, -1.0f);
    }
    
    if ([_interfaceLayer isButtonPressed]) {
        CCLOG(@"Button Pressed");
        
         _levelLayer.playerDirection = ccp(2.0f, _levelLayer.playerDirection.y);

     /*   CGPoint myPosition = _levelLayer.parent.position;
        
        myPosition.x -= 10;
        _levelLayer.parent.position = myPosition;*/
    }
    
    if ([_interfaceLayer isButtonClicked]) {
        CCLOG(@"Button Clicked");
        [_interfaceLayer resetButtonState];

        _levelLayer.playerDirection = ccp(0.0f, _levelLayer.playerDirection.y);
    }
    

    if ([_interfaceLayer isUpButtonClicked] || [_interfaceLayer isDownButtonClicked]) {
        [_interfaceLayer resetUpButton];
        [_interfaceLayer resetDownButton];
        _levelLayer.playerDirection = ccp(_levelLayer.playerDirection.x, 0.0f);
        
    }

}

@end
