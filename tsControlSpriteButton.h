//
//  tsControlSpriteButton.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 19.08.12.
//
//

#import "CCSprite.h"
#import "tsControlButton.h"

@interface tsControlSpriteButton : CCSprite {
    CCSprite *_defaultSprite;
    
    tsControlButton *_button;
}
@property (nonatomic, retain) CCSprite *defaultSprite;
@property (nonatomic, retain) tsControlButton *button;

@end
