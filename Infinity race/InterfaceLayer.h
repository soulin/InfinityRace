//
//  InterfaceLayer.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 04.09.12.
//
//

#import "CCLayer.h"

@class tsControlSpriteButton;
@class tsControlButton;

@interface InterfaceLayer : CCLayer {
    tsControlSpriteButton *_button;
    tsControlSpriteButton *_resetButton;
    tsControlSpriteButton *_upButton;
    tsControlSpriteButton *_downButton;
   // tsControlButton *_rightButton;
    //tsControlButton *_resetButton1;
}

-(id) init;

-(bool) isButtonClicked;
-(bool) isButtonPressed;
-(void) resetButtonState;

-(bool) isResetButtonClicked;

-(bool) isUpButtonPressed;
-(bool) isDownButtonPressed;
-(bool) isUpButtonClicked;
-(bool) isDownButtonClicked;

-(void) resetUpButton;
-(void) resetDownButton;

@end
