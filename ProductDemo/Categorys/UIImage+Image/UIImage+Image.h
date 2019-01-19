//
//  UIImage+Image.h
//  XianYu
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)


/**
 根据颜色生成一张图片

 @param color 颜色
 @return 生成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 把图片按照指定比例缩放

 @param image 要缩放的图片
 @param scaleRate 缩放比例
 @return 缩放后的图片
 */
+ (UIImage *)scaleImage:(UIImage *)image toRate:(float)scaleRate;

/**
 将图片压缩到指定尺寸

 @param image 原始图片
 @param reSize 尺寸
 @return 压缩后的图片
 */
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

/**
 返回一张截取指定view的图片

 @param theView 要截取的view
 @return 截取的图片
 */
+ (UIImage*)captureView:(UIView *)theView;

/**
 将图片以指定名称保存到指定路径

 @param image 图片
 @param path 文件夹路径
 @param name 保存后的图片名称
 @return 保存是否成功
 */
+ (BOOL)writeImage:(UIImage *)image toPath:(NSString *)path withName:(NSString *)name;

/**
 裁剪图片的指定区域

 @param image 原始图片
 @param rect 要裁剪的区域
 @return 返回裁剪的图片
 */
+ (UIImage*)getSubImage:(UIImage *)image withRect:(CGRect)rect;

@end
