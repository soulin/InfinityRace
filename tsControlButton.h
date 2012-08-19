//
//  tsControlButton.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 18.08.12.
//
//

#import "CCNode.h"
#import "cocos2d.h"

@interface tsControlButton : CCNode <CCTargetedTouchDelegate> {
    CGPoint _center;
    CGRect _bounds;
    
    float _radius;
    
    BOOL _active;
}

@property (nonatomic, readonly) BOOL active;
@property (nonatomic, assign) float radius;

-(id) initWithRect:(CGRect) rect;

@end
