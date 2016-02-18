//
//  CYDialogBox.h
//  CYDialogBox
//
//  Created by vis on 16/1/11.
//  Copyright © 2016年 vis. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DialogBoxDirection){
    left = 0,
    right,
    top,
    bottom
};

typedef NS_ENUM (NSInteger,DialogMode){
    value1 = 0,//仅lable
    value2,//仅图片
    value3,//图片在上，lable在下
    value4 //lable在上图片在下
};

@interface CYDialogBox : UIView
//尖角的位置
@property(nonatomic,assign)CGFloat ratio;
//尖角方向
@property(nonatomic,assign)DialogBoxDirection direction;
//对话框size
@property(nonatomic,assign)CGSize size;

@property(nonatomic,assign)CGLineJoin lineJoinStyle;
//背景视图
@property(nonatomic,strong)UIView *backgroundView;
//dialog模式
@property(nonatomic,assign)DialogMode dialogMode;

@property(nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)NSString *text;
@property(nonatomic,strong)UIImage *image;



- (instancetype)initDialogWithFrame:(CGRect)frame;

- (instancetype)initDialogWithFrame:(CGRect)frame andDialogMode:(DialogMode)dialogMode;

- (instancetype)initDialogWithFrame:(CGRect)frame andDialogMode:(DialogMode)dialogMode andDirection:(DialogBoxDirection)direction;

- (CAShapeLayer *)drawDialogBox:(DialogBoxDirection)direction andRatio:(CGFloat)ratio andSize:(CGSize)size;
@end
