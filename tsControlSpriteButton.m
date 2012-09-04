//
//  tsControlSpriteButton.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 19.08.12.
//
//

#import "tsControlSpriteButton.h"

@implementation tsControlSpriteButton

@synthesize button = _button;
@synthesize defaultSprite = _defaultSprite;

- (void) dealloc
{
	[_defaultSprite release];
	[_button release];
	[super dealloc];
}

- (id) init
{
	self = [super init];
	if(self != nil){
		_defaultSprite = nil;
		_button = nil;
        
	}
	return self;
}

- (void) setDefaultSprite:(CCSprite *)aSprite
{
	if(_defaultSprite){
		if(_defaultSprite.parent)
			[_defaultSprite.parent removeChild:_defaultSprite cleanup:YES];
		[_defaultSprite release];
	}
	_defaultSprite = [aSprite retain];
	if(aSprite){
		[self addChild:_defaultSprite z:0];
        
		[self setContentSize:_defaultSprite.contentSize];
	}
}

- (void) setButton:(tsControlButton *)aButton
{
	if(_button){
		if(_button.parent)
			[_button.parent removeChild:_button cleanup:YES];
		[_button release];
	}
	_button = [aButton retain];
	if(aButton){
		[self addChild:_button z:4];
		if(_defaultSprite)
			[_button setRadius:_defaultSprite.contentSize.width/2];
	}
}

@end
