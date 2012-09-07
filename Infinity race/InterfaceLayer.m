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

-(id) init {
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    if (self = [super init]) {
        CCSprite *tmp = [CCSprite spriteWithFile:@"button-close.png"];
        
        CCLOG(@"Screen h: %f w: %f", screen.height, screen.width);
        CCLOG(@"Sprite h: %f w: %f", tmp.contentSize.height, tmp.contentSize.width);
        
        _button = [[tsControlSpriteButton alloc] init];
        _button.position = CGPointMake(screen.height, tmp.contentSize.width);
        _button.button = [[tsControlButton alloc] initWithRect:CGRectMake(0, 0, 64, 64)];
        _button.button.radius = 32.0f;
        _button.defaultSprite = tmp;
        _rightButton = [_button.button retain];
        _button.defaultSprite.visible = YES;
        [self addChild:_button];
    }
    
    return self;
}
-(bool) isButtonClicked {
    return _button.button.state == BUTTON_STATE_CLICKED ? YES : NO;
}

-(bool) isButtonPressed {
      return _button.button.state == BUTTON_STATE_PRESSED ? YES : NO;
}

-(void) resetButtonState {
    [_button.button resetState];
}

@end
