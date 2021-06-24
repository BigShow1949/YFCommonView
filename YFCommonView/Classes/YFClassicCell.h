//
//  YFClassicCell.h
//  Medicine
//
//  Created by BigShow on 2021/4/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface YFClassicCell : UICollectionViewCell


@property (nonatomic,copy) void(^cellClick) (void);
@property(nonatomic,strong) UIImageView *imgView;
@property(nonatomic,strong) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END

