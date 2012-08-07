//
//  Vector3.h
//  Infinity race
//
//  Created by Maxim Cherkasov on 07.08.12.
//
//

#import <Foundation/Foundation.h>

@interface Vector3 : NSObject {
    @public
        float x;
        float y;
        float z;
}

@property (readwrite, assign) float x;
@property (readwrite, assign) float y;
@property (readwrite, assign) float z;

@end
