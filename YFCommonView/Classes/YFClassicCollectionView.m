//
//  YFClassicCollectionView.m
//  YFCommonView
//
//  Created by BigShow on 2021/6/16.
//

#import "YFClassicCollectionView.h"
#import "YFClassicCell.h"

@interface YFClassicCollectionView ()<UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIImageView *bgImageView;
@end

@implementation YFClassicCollectionView



- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self setup];
    }
    return self;
}
/**
 注意如果从xib加载，需要拖动collectionView控件，不然有layout 那么sizeForItemAtIndexPath 不会调用。所以cellForItemAtIndexPath就不会调用
 */
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self registerClass:[YFClassicCell class ] forCellWithReuseIdentifier:NSStringFromClass([self class])];
    self.dataSource = self ;
    self.delegate = self ;
    self.backgroundColor = [UIColor whiteColor];
    self.showsHorizontalScrollIndicator = NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.bgImageView) {
        self.bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.bgImageView.image = [UIImage imageNamed:@"蒙版组 53"];
        [self insertSubview:self.bgImageView atIndex:0];
    }
}

//定义展示的UICollectionViewCell的个数
-( NSInteger )collectionView:( UICollectionView *)collectionView numberOfItemsInSection:( NSInteger )section{
    return self.imgArr.count;
}

//每个UICollectionView展示的内容
-( UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath{
    YFClassicCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath :indexPath];
    cell.imgView.image = [UIImage imageNamed:self.imgArr[indexPath.row]];
    cell.titleLabel.text = self.titleArr[indexPath.row];
    cell.cellClick = ^{
        if (self.clickAction) {
            self.clickAction(indexPath.row);
        }
    };
    return cell;
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    if (self.clickAction) {
        self.clickAction(indexPath.row);
    }
}

//返回这个UICollectionViewCell是否可以被选择
-( BOOL )collectionView:( UICollectionView *)collectionView shouldSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    return YES ;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath{
    return CGSizeMake ( self.frame.size.width/self.imgArr.count, self.frame.size.height);
}

//定义每个UICollectionView 的边距(次序: 上，左，下，右边)
-( UIEdgeInsets )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section{
    return UIEdgeInsetsMake ( 0 , 0 , 0 , 0 );
}

//设置单元格间的横向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

//设置单元格间的竖向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


@end
