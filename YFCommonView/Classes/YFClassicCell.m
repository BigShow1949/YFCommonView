//
//  YFClassicCell.m
//  Medicine
//
//  Created by BigShow on 2021/4/28.
//

#import "YFClassicCell.h"

#define kFontRegularSize(font)  [UIFont fontWithName:@"PingFang-SC-Regular" size:font]
#define kFontMediumSize(font)   [UIFont fontWithName:@"PingFang-SC-Medium" size:font]
#define kFontBoldSize(font)     [UIFont fontWithName:@"PingFang-SC-Semibold" size:font]
//
//#pragma mark - 颜色
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface YFClassicCell ()

@end

@implementation YFClassicCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
        [self setupUI];
        [self setupConstraint];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
        [self setupConstraint];
    }
    return self;
}


- (void)click {
    if (self.cellClick) {
        self.cellClick();
    }
}


- (void)setupUI {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:tap];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    self.imgView = imgView;
    [self.contentView addSubview:imgView];
    
    
    UILabel *titleLabel = [self createLabel:kFontBoldSize(14) textColor:HexRGB(333333) textAlignment:NSTextAlignmentCenter];
    self.titleLabel = titleLabel;
    [self.contentView addSubview:titleLabel];
}

- (void)setupConstraint {
   
    CGFloat imgWH = 50;
    CGFloat x = (self.frame.size.width - imgWH)/2;
    self.imgView.frame = CGRectMake(x, 15, imgWH, imgWH);
    
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imgView.frame)+15, self.frame.size.width, 20);
}

- (UILabel *)createLabel:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}


@end
