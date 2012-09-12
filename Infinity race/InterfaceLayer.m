//
//  InterfaceLayer.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 04.09.12.
//
//

#import "InterfaceLayer.h"

#import "tsControlButton.h"
#import "tsControlSpriteButton.h"

@implementation InterfaceLayer

-(void) onEnter {
    CGSize screen = [[CCDirector sharedDirector] winSize];
    CCSprite *tmp = [CCSprite spriteWithFile:@"button-close.png"];
    
    CCLOG(@"Screen h: %f w: %f", screen.height, screen.width);
    CCLOG(@"Sprite h: %f w: %f", tmp.contentSize.height, tmp.contentSize.width);
    
    _button = [[tsControlSpriteButton alloc] init];
    _button.position = CGPointMake(screen.width, tmp.contentSize.height);
    _button.button = [[tsControlButton alloc] initWithRect:CGRectMake(0, 0, 64, 64)];
    _button.button.radius = 32.0f;
    _button.defaultSprite = tmp;
    _button.defaultSprite.visible = YES;
    [self addChild:_button];
    
    CCSprite *tmp1 = [CCSprite spriteWithFile:@"button-close.png"];
    _resetButton = [[tsControlSpriteButton alloc] init];
    _resetButton.position = CGPointMake(screen.width, screen.height);
    _resetButton.button = [[tsControlButton alloc] initWithRect:CGRectMake(0, 0, 64, 64)];
    _resetButton.button.radius = 32.0f;
    _resetButton.defaultSprite = tmp1;
    _resetButton.defaultSprite.visible = YES;
    [self addChild:_resetButton];
    
    CCSprite *tmp2 = [CCSprite spriteWithFile:@"button-up.png"];
    tmp2.scale = 0.25;
    _upButton = [[tsControlSpriteButton alloc] init];
    _upButton.position = CGPointMake(96, 160);
    _upButton.button = [[tsControlButton alloc] initWithRect:CGRectMake(0, 0, 64, 64)];
    _upButton.button.radius = 32.0f;
    _upButton.defaultSprite = tmp2;
    _upButton.defaultSprite.visible = YES;
    [self addChild:_upButton];
    
    CCSprite *tmp3 = [CCSprite spriteWithFile:@"button-up.png"];
    tmp3.rotation = 180.0f;
    tmp3.scale = 0.25f;
    _downButton = [[tsControlSpriteButton alloc] init];
    _downButton.position = CGPointMake(96, 96);
    _downButton.button = [[tsControlButton alloc] initWithRect:CGRectMake(0, 0, 64, 64)];
    _downButton.button.radius = 32.0f;
    _downButton.defaultSprite = tmp3;
    _downButton.defaultSprite.visible = YES;
    [self addChild:_downButton];
}

-(id) init {

    
    if (self = [super init]) {

        
    }
    
    return self;
}

-(bool) isResetButtonClicked {
    return _resetButton.button.state == BUTTON_STATE_CLICKED ? YES : NO;
}

-(bool) isButtonClicked {
    return _button.button.state == BUTTON_STATE_CLICKED ? YES : NO;
}

-(bool) isButtonPressed {
    return _button.button.state == BUTTON_STATE_PRESSED ? YES : NO;
}

-(void) resetButtonState {
    [_button.button resetState];
    [_resetButton.button resetState];
}

-(bool) isUpButtonPressed {
    return _upButton.button.state == BUTTON_STATE_PRESSED ? YES : NO;
}

-(bool) isDownButtonPressed {
    return _downButton.button.state == BUTTON_STATE_PRESSED ? YES : NO;
}

-(bool) isUpButtonClicked {
    return _upButton.button.state == BUTTON_STATE_CLICKED ? YES : NO;
}

-(bool) isDownButtonClicked {
    return _downButton.button.state == BUTTON_STATE_CLICKED ? YES : NO;
}

-(void) resetUpButton {
    [_upButton.button resetState];
}

-(void) resetDownButton {
    [_downButton.button resetState];
}

@end
