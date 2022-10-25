//
//  OpenCVWrapper.h
//  TextureInjection
//
//  Created by M. Alfiansyah Nur Cahya Putra on 25/10/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWrapper : NSObject

+(NSString *) openCVVersionString;

+(UIImage *) makeGreyFromImage:(UIImage *) image;

+(UIImage *) classifyImage: (UIImage *) image;

@end

NS_ASSUME_NONNULL_END
