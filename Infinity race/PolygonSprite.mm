//
//  PolygonSprite.m
//  Infinity race
//
//  Created by Maxim Cherkasov on 07.08.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PolygonSprite.h"
#import "triangulate.h"
//#import "Vector3D.h"


@implementation PolygonSprite

@synthesize vertices = _vertices;
@synthesize triangles = _triangles;

-(id)init {
    self = [super init];
    if (self != nil) {
		self.anchorPoint = ccp([self contentSize].width/2,[self contentSize].height/2);
    }
    return self;
}

+(id) createWithFile:(NSString*)file withVertices:(NSArray*)verts {
    PolygonSprite *ps = [PolygonSprite spriteWithFile:file];
	ps.vertices = [[NSMutableArray alloc] init];
	ps.triangles = [[NSMutableArray alloc] init];
    
    Vector2dVector a;
    
    for (int i=0; i<verts.count; i++) {
        [ps.vertices addObject:[verts objectAtIndex:i]];
        
        CGPoint vert = [[verts objectAtIndex:i] CGPointValue];
        
        a.push_back(Vector2d(vert.x, vert.y));
    }
    
    Vector2dVector result;
	Triangulate::Process(a,result);
    
    int tcount = result.size()/3;
	for (int i=0; i<tcount; i++) {
		const Vector2d &p1 = result[i*3+0];
		const Vector2d &p2 = result[i*3+1];
		const Vector2d &p3 = result[i*3+2];
		
		NSLog(@"Triangle %d => (%f,%f) (%f,%f) (%f,%f)",i+1,p1.GetX(),p1.GetY(),p2.GetX(),p2.GetY(),p3.GetX(),p3.GetY());
		
		//Add triangle index
		[ps.triangles addObject: [ps getTriangleIndicesFromPoint1:ccp(p1.GetX(),p1.GetY()) point2:ccp(p2.GetX(),p2.GetY()) point3:ccp(p3.GetX(), p3.GetY())] ];
	}
    
    [ps setCoordInfo];
	
    return ps;
}

-(void) setCoordInfo {
	/*** Set texture coordinates for each vertex ***/
    
	if(coords){ free(coords); }
	coords = (ccV2F_T2F*)malloc(sizeof(ccV2F_T2F)*[_vertices count]);
	
	for(int i=0;i<[_vertices count];i++) {
		coords[i].vertices.x = [[_vertices objectAtIndex:i] CGPointValue].x;
		coords[i].vertices.y = [[_vertices objectAtIndex:i] CGPointValue].y;
		
		float atlasWidth = texture_.pixelsWide;
		float atlasHeight = texture_.pixelsHigh;
		
		coords[i].texCoords.u = (coords[i].vertices.x + rect_.origin.x)/ atlasWidth;
		coords[i].texCoords.v = (contentSize_.height - coords[i].vertices.y + rect_.origin.y)/ atlasHeight ;
	}
}

-(Vector3*) getTriangleIndicesFromPoint1:(CGPoint)p1 point2:(CGPoint)p2 point3:(CGPoint)p3 {
	/*** Convert three polygon vertices to triangle indices ***/
	
	Vector3* indices = [Vector3 x:-1 y:-1 z:-1];
	
	for(int i=0; i< [_vertices count]; i++){
		CGPoint vert = [[_vertices objectAtIndex:i] CGPointValue];
		if(p1.x == vert.x and p1.y == vert.y){
			indices.x = i;
		}else if(p2.x == vert.x and p2.y == vert.y){
			indices.y = i;
		}else if(p3.x == vert.x and p3.y == vert.y){
			indices.z = i;
		}
	}
    
	return indices;
}


-(void) dealloc {
	if(coords) free(coords);
	
	[_vertices release];
	[_triangles release];
	
	[super dealloc];
}

-(void) draw
{
    
    /*
    CC_NODE_DRAW_SETUP();
    CC_NODE_DRAW_SETUP();
    
    ccGLBindTexture2D( self.texture.name );
    
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    
    ccGLBlendFunc( blendFunc.src, blendFunc.dst);
    
    ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position | kCCVertexAttribFlag_TexCoords );
    
    glVertexAttribPointer(kCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, areaTrianglePoints);
    glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, 0, textureCoordinates);
    
    glDrawArrays(GL_TRIANGLES, 0, areaTrianglePointCount);


    
	glDisableClientState(GL_COLOR_ARRAY);
	
	glColor4ub( color_.r, color_.g, color_.b, quad_.bl.colors.a);
	
	BOOL newBlend = NO;
	if( blendFunc_.src != CC_BLEND_SRC || blendFunc_.dst != CC_BLEND_DST ) {
		newBlend = YES;
		glBlendFunc( blendFunc_.src, blendFunc_.dst );
	}
	
	glBindTexture(GL_TEXTURE_2D, texture_.name);
	
	unsigned int offset = (unsigned int)coords;
	unsigned int diff = offsetof( ccV2F_T2F, vertices);
	glVertexPointer(2, GL_FLOAT, sizeof(ccV2F_T2F), (void*) (offset + diff));
	diff = offsetof( ccV2F_T2F, texCoords);
	glTexCoordPointer(2, GL_FLOAT, sizeof(ccV2F_T2F), (void*) (offset + diff));
	
	for(int i=0;i<[triangles count];i++){
		Vector3D *tri = [triangles objectAtIndex:i];
		short indices[] = {tri.x, tri.y, tri.z};
		glDrawElements(GL_TRIANGLE_STRIP, 3, GL_UNSIGNED_SHORT, indices);
	}
    
	if(newBlend) { glBlendFunc(CC_BLEND_SRC, CC_BLEND_DST); }
	
	glColor4ub( 255, 255, 255, 255);
	
	glEnableClientState(GL_COLOR_ARRAY);
     */
}

@end
