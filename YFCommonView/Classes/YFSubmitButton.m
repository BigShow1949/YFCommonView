//
//  YFSubmitButton.m
//  YFCommonView
//
//  Created by BigShow on 2021/6/22.
//

#import "YFSubmitButton.h"

@implementation YFSubmitButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
}


- (void)setEnabled:(BOOL)enabled {
    if (enabled) {
        self.backgroundColor = [UIColor blueColor];
    }else {
        self.backgroundColor = [UIColor yellowColor];
    }
}
@end
