//
//  Vector3.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 07.08.12.
//
//

#import "Vector3.h"

@implementation Vector3

+(id) x:(float)iX y:(float)iY z:(float)iZ {
	return [[self alloc] x:iX y:iY z:iZ];
}

-(id) x:(float)iX y:(float)iY z:(float)iZ {
	if(self = [super init]){
		self.x = iX;
		self.y = iY;
		self.z = iZ;
	}
	return self;
}


@end
