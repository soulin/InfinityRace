//
//  LevelScene.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 08.09.12.
//
//

#import "CCLayer.h"
#import "box2d.h"
#import "GLES-Render.h"

@class InterfaceLayer;
@class LevelManager;

@interface LevelScene : CCLayer {
    InterfaceLayer *_interfaceLayer;
    LevelManager *_levelLayer;
    
    b2World* _world;					// strong ref
	GLESDebugDraw *_m_debugDraw;		// strong ref
}

@property (nonatomic, retain) InterfaceLayer *interfaceLayer;

+(id) scene;
//-(id) initWithHUD:(InterfaceLayer *) interface;
-(void) initPhysics;

@end
