//
//  YFClassicCollectionView.h
//  YFCommonView
//
//  Created by BigShow on 2021/6/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ClickAction)(NSUInteger row);

@interface YFClassicCollectionView : UICollectionView
@property(nonatomic,strong) NSArray *imgArr;
@property(nonatomic,strong) NSArray *titleArr;
@property(nonatomic,copy) ClickAction clickAction;

@end

NS_ASSUME_NONNULL_END
