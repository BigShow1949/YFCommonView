//
//  YFSettingCell.m
//  YFCommonView
//
//  Created by BigShow on 2021/6/16.
//

#import "YFSettingCell.h"
#import "UIImage+Bundle.h"

@implementation YFSettingCellGroupModel
- (NSMutableArray<YFSettingCellModel *> *)modelArr {
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}

@end

@implementation YFSettingCellModel

+ (YFSettingCellModel *)modelWithTitle:(NSString *)title leftImgName:(NSString *)leftImgName {
    return [self modelWithTitle:title leftImgName:leftImgName destination:nil];
}

+ (YFSettingCellModel *)modelWithTitle:(NSString *)title leftImgName:(NSString *)leftImgName destination:(id)destination {
    YFSettingCellModel *model = [[YFSettingCellModel alloc] init];
    model.title = title;
    model.leftImg = [UIImage imageNamedBundle:leftImgName];
    model.destination = destination;
    return model;
}


+ (YFSettingCellModel *)modelWithTitle:(NSString *)title destination:(id)destination {
    UIColor *titleColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    return [self modelWithTitle:title titleColor:titleColor destination:destination];;
}

+ (YFSettingCellModel *)modelWithTitle:(NSString *)title titleColor:(UIColor *)textColor destination:(id)destination {
    YFSettingCellModel *model = [[YFSettingCellModel alloc] init];
    model.title = title;
    model.titleColor = textColor;
    model.destination = destination;
    return model;
}

+ (YFSettingCellModel *)modelWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle destination:(id)destination {
    YFSettingCellModel *model = [[YFSettingCellModel alloc] init];
    model.title = title;
    model.rightTitle = rightTitle;
    model.destination = destination;
    return model;
}
+ (YFSettingCellModel *)modelWithTitle:(NSString *)title rightImgName:(NSString *)rightImgName destination:(id)destination {
    YFSettingCellModel *model = [[YFSettingCellModel alloc] init];
    model.title = title;
    model.rightImg = [UIImage imageNamedBundle:rightImgName];
    model.destination = destination;
    return model;
}

+ (YFSettingCellModel *)modelWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle {
    YFSettingCellModel *model = [[YFSettingCellModel alloc] init];
    model.title = title;
    model.rightTitle = rightTitle;
    return model;
}

@end

@interface YFSettingCell ()

// 左边图片
@property (weak, nonatomic) IBOutlet UIImageView *leftImgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftImgViewLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftImgViewWidth;

// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

// 右边图片
@property (weak, nonatomic) IBOutlet UIImageView *rightImgView;

// 右边标题
@property (weak, nonatomic) IBOutlet UILabel *rightTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightTitleWidth;

// 右边箭头
@property (weak, nonatomic) IBOutlet UIImageView *arrowImgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowImgViewRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowImgViewWidth;

@end

@implementation YFSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.arrowImgView.image = [UIImage imageNamedBundle:@"mine_right"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"YFSettingCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NSBundle bundleForClass:[self class]] loadNibNamed:@"YFSettingCell" owner:self options:nil].firstObject;
    }
    return cell;
}

- (void)setModel:(YFSettingCellModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    
    if (model.leftImg) {
        self.leftImgView.image = model.leftImg;
        self.leftImgViewLeftConstraint.constant = 16;
        self.leftImgViewWidth.constant = 24;
    }else {
        self.leftImgViewLeftConstraint.constant = 0;
        self.leftImgViewWidth.constant = 0;
    }
    
    if (model.rightTitle) {
        self.rightTitleLabel.text = model.rightTitle;
        self.rightTitleWidth.constant = ceilf([self.rightTitleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.rightTitleLabel.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil].size.width);
    }else {
        self.rightTitleWidth.constant = 0;
    }
    
    if (model.rightImg) {
        self.rightImgView.image = model.rightImg;
    }
    
    if (model.destination) {
        if (model.arrowImg) self.arrowImgView.image = model.arrowImg;
        self.arrowImgViewRight.constant = 16;
        self.arrowImgViewWidth.constant = 12;

    }else {
        self.arrowImgViewRight.constant = 0;
        self.arrowImgViewWidth.constant = 0;
    }
    if (model.titleColor) self.titleLabel.textColor = model.titleColor;
    
}



@end
