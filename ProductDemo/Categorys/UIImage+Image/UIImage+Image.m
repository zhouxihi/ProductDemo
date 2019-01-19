//
//  UIImage+Image.m
//  XianYu
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (UIImage *)imageWithColor:(UIColor *)color {

    //描述一个矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);

    //获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    //使用color演示填充上下文
    CGContextSetFillColorWithColor(ctx, [color CGColor]);

    //渲染上下文
    CGContextFillRect(ctx, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (UIImage *)scaleImage:(UIImage *)image toRate:(float)scaleRate {
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleRate, image.size.height * scaleRate));
                                
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleRate, image.size.height * scaleRate)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
                                
    return scaledImage;
                                
}

+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize {
    
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}

+ (UIImage*)captureView:(UIView *)theView {
    
    CGRect rect = theView.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
    
}

+ (BOOL)writeImage:(UIImage *)image toPath:(NSString *)path withName:(NSString *)name {
    
    NSString *link = [path stringByAppendingPathComponent:name];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    if ([UIImagePNGRepresentation(image) writeToFile:link atomically:YES]) {
        
        return TRUE;
    } else {
        
        return FALSE;
    }
}

+ (UIImage*)getSubImage:(UIImage *)image withRect:(CGRect)rect {
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

@end
