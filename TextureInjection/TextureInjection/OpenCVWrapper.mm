//
//  OpenCVWrapper.m
//  TextureInjection
//
//  Created by M. Alfiansyah Nur Cahya Putra on 25/10/22.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "OpenCVWrapper.h"

@implementation OpenCVWrapper

+(NSString *) openCVVersionString
{
    return [NSString stringWithFormat:@"OpenCV Version %s", CV_VERSION];
}

#pragma mark - Convert to grayscale
+ (UIImage *)makeGreyFromImage:(UIImage *)image
{
    // Transform UIImage to cv::Mat
    cv::Mat imageMat;
    UIImageToMat(image, imageMat);
    
    // If image was already grayscale, return it
    if (imageMat.channels() == 1) return image;
    
    // Transform the cv::Mat color image to gray
    cv::Mat grayMat;
    cv::cvtColor(imageMat, grayMat, cv::COLOR_BGR2GRAY);
    
    return MatToUIImage(grayMat);
}

#pragma mark - Classify Image
+(UIImage *) classifyImage: (UIImage *) image {
    // Convert UIImage to CV Mat
    cv::Mat colorMat;
    UIImageToMat(image, colorMat);

    // Convert to grayscale
    cv::Mat grayMat;
    cv::cvtColor(colorMat, grayMat, cv::COLOR_BGR2GRAY);

    // Load classifier from file
    cv::CascadeClassifier classifier;
    const NSString* cascadePath = [[NSBundle mainBundle]
                             pathForResource:@"haarcascade_frontalface_default"
                             ofType:@"xml"];
    classifier.load([cascadePath UTF8String]);

    // Initialize vars for classifier
    std::vector<cv::Rect> detections;

    const double scalingFactor = 1.1;
    const int minNeighbors = 2;
    const int flags = 0;
    const cv::Size minimumSize(300, 300);

    // Classify function
    classifier.detectMultiScale(
                                grayMat,
                                detections,
                                scalingFactor,
                                minNeighbors,
                                flags,
                                minimumSize
                                );

    NSLog(@"faces count : %lu", detections.size());
    // If no detections found, return nil
    if (detections.size() <= 0 && detections.size() > 1) {
        return nil;
    }

    // Crop face
    const cv::Rect face = detections[0];
//    const cv::String name = ".jpg";
    cv::Mat output;
    cv::Rect myROI(face.x, face.y, face.width, face.height);
    output = grayMat(myROI);
//    cv::imwrite(name, output);
    return MatToUIImage(output);
    
    // Range loop through detections
//    for (auto &face : detections) {
//        const cv::Point tl(face.x,face.y);
//        const cv::Point br = tl + cv::Point(face.width, face.height);
//        const cv::Scalar magenta = cv::Scalar(255, 0, 255);
//
//        cv::rectangle(grayMat, tl, br, magenta, 4, 8, 0);
//    }
//
//    return MatToUIImage(grayMat);
}

@end
