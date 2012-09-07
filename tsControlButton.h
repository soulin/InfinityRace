//
//  tsControlButton.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 18.08.12.
//
//

#import "CCNode.h"
#import "cocos2d.h"

enum {
    BUTTON_STATE_NONE = 0,
    BUTTON_STATE_CLICKED,
    BUTTON_STATE_PRESSED
};

@interface tsControlButton : CCNode <CCTargetedTouchDelegate> {
    CGPoint _center;
    CGRect _bounds;
    
    float _radius;
    
    int _state;
}

@property (nonatomic, assign) int state;
@property (nonatomic, assign) float radius;

-(id) initWithRect:(CGRect) rect;
-(void) resetState;

@end
