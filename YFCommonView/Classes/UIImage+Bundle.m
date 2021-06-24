//
//  UIImage+Bundle.m
//  YFCommonView
//
//  Created by BigShow on 2021/6/18.
//

#import "UIImage+Bundle.h"

@implementation UIImage (Bundle)

+ (UIImage *)imageNamedBundle:(NSString *)name {
    NSString *bundleName = [@"YFCommonView.bundle" stringByAppendingPathComponent:name];
    NSString *frameWorkName = [@"Frameworks/YFCommonView.framework/YFCommonView.bundle" stringByAppendingPathComponent:name];
    
    UIImage *image = [UIImage imageNamed:bundleName] ?: [UIImage imageNamed:frameWorkName];
    if (!image) image = [UIImage imageNamed:name];
    return image;
}
@end
