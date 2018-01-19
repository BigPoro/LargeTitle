//
//  DynamicBigTitleView.m
//  BigTitle_Demo
//
//  Created by iDog on 2018/1/16.
//  Copyright © 2018年 iDog. All rights reserved.
//

#import "DynamicBigTitleView.h"

@interface DynamicBigTitleView  ()

@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UILabel *bigTitleLabel;
@property (nonatomic, strong) UILabel *detailTitleLabel;
@end

@implementation DynamicBigTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}

#pragma mark - private

- (void)configSubviews
{
    [self addSubview:self.bigTitleLabel];
    [self.bigTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.bottom.equalTo(self).offset(-10);
    }];
    
    [self addSubview:self.bottomLine];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(1 / kSCreenScale));
        make.bottom.equalTo(self);
    }];

}


#pragma mark - getter and setter

- (UILabel *)bigTitleLabel
{
    if (!_bigTitleLabel) {
        _bigTitleLabel = [UILabel new];
        _bigTitleLabel.font = [UIFont boldSystemFontOfSize:28];
        _bigTitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }
    return _bigTitleLabel;
}
- (UILabel *)detailTitleLabel
{
    if (!_detailTitleLabel) {
        _detailTitleLabel = [[UILabel alloc]init];
        _detailTitleLabel.font = [UIFont systemFontOfSize:14];
        _detailTitleLabel.textColor = [UIColor grayColor];
        [self addSubview:_detailTitleLabel];
        [_detailTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bigTitleLabel);
            make.bottom.equalTo(self.bigTitleLabel.mas_top);
        }];
    }
    return _detailTitleLabel;
}
- (void)setRightView:(UIView *)rightView{
    _rightView = rightView;
    
    [self addSubview:rightView];
    [rightView sizeToFit];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(- 20);
        make.centerY.equalTo(self.bigTitleLabel);
//        make.width.height.mas_equalTo(40);
    }];
}
- (void)setDetailTitle:(NSString *)detailTitle{
    _detailTitle = detailTitle;
    self.detailTitleLabel.text = detailTitle;
}
- (void)setBigTitle:(NSString *)bigTitle{
    _bigTitle = bigTitle;
    self.bigTitleLabel.text = bigTitle;
}

- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = [UIColor grayColor];
    }
    return _bottomLine;
}


@end
