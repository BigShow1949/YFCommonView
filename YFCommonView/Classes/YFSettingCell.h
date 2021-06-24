//
//  YFSettingCell.h
//  YFCommonView
//
//  Created by BigShow on 2021/6/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFSettingCellModel : NSObject
/**关联的相关数据*/
@property (nonatomic, strong) id data;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor; // 默认 0x333333

@property (nonatomic, copy) NSString *rightTitle;


@property (nonatomic, strong) id destination;
@property (nonatomic, strong) UIImage *leftImg;
@property (nonatomic, strong) UIImage *rightImg;
@property (nonatomic, strong) UIImage *arrowImg;
// 全局设置右边箭头

+ (YFSettingCellModel *)modelWithTitle:(NSString *)title leftImgName:(NSString *)leftImgName;
+ (YFSettingCellModel *)modelWithTitle:(NSString *)title leftImgName:(NSString *)leftImgName destination:(id)destination;


+ (YFSettingCellModel *)modelWithTitle:(NSString *)title destination:(id)destination;
+ (YFSettingCellModel *)modelWithTitle:(NSString *)title titleColor:(UIColor *)textColor destination:(id)destination;

+ (YFSettingCellModel *)modelWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle destination:(nullable id)destination;
+ (YFSettingCellModel *)modelWithTitle:(NSString *)title rightImgName:(NSString *)rightImgName destination:(nullable id)destination;


+ (YFSettingCellModel *)modelWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle;

@end



@interface YFSettingCellGroupModel : NSObject
@property (nonatomic, strong) NSMutableArray<YFSettingCellModel *> *modelArr;
@property (nonatomic, copy) NSString *headTitle;

@end


@interface YFSettingCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) YFSettingCellModel *model;
@end

NS_ASSUME_NONNULL_END
