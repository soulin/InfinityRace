//
//  PolygonSprite.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 07.08.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Vector3.h"

typedef struct _ccV2F_T2F
{
	ccVertex2F		vertices;
	ccTex2F			texCoords;
} ccV2F_T2F;

@interface PolygonSprite : CCSprite {
    NSMutableArray* _vertices;
	NSMutableArray* _triangles;
    
    ccV2F_T2F* coords;
}
@property (nonatomic, retain) NSMutableArray* vertices;
@property (nonatomic, retain) NSMutableArray* triangles;

+(id) createWithFile:(NSString*)file withVertices:(NSArray*)verts;
-(Vector3*) getTriangleIndicesFromPoint1:(CGPoint)p1 point2:(CGPoint)p2 point3:(CGPoint)p3;
-(void) setCoordInfo;

@end
