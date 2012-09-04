//
//  SceneManager.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 23.08.12.
//
//

#import "SceneManager.h"
#import "LevelManager.h"

@implementation SceneManager

-(id) initWithWorld:(b2World *)world
{
    if ((self = [super init])) {
        _levelManger = [[LevelManager alloc] initWithWorld:world];
        _playerManager = [[PlayerManager alloc] initWithWorld:world];
    }
    
    return self;
}

-(void) dealloc {
    [_levelManger release];
    [_playerManager release];
    [super dealloc];
}

@end
