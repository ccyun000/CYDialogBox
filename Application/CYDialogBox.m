//
//  CYDialogBox.m
//  CYDialogBox
//
//  Created by vis on 16/1/11.
//  Copyright © 2016年 vis. All rights reserved.
//

#import "CYDialogBox.h"

@implementation CYDialogBox

- (instancetype)initDialogWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.size = frame.size;
        self.dialogMode = value1;
        self.direction = left;
        
        CAShapeLayer *layer = [self drawDialogBox:_direction andRatio:0.3 andSize:frame.size];
        self.layer.mask = layer;
    }
    return self;
}

- (instancetype)initDialogWithFrame:(CGRect)frame andDialogMode:(DialogMode)dialogMode{
    if (self = [super initWithFrame:frame]) {
        self.size = frame.size;
        self.dialogMode = dialogMode;
        self.direction = left;
        
        CAShapeLayer *layer = [self drawDialogBox:_direction andRatio:0.3 andSize:frame.size];
        self.layer.mask = layer;
    }
    return self;
}

- (instancetype)initDialogWithFrame:(CGRect)frame andDialogMode:(DialogMode)dialogMode andDirection:(DialogBoxDirection)direction{
    if (self = [super initWithFrame:frame]) {
        self.size = frame.size;
        self.dialogMode = dialogMode;
        self.direction = direction;
        
        CAShapeLayer *layer = [self drawDialogBox:_direction andRatio:0.3 andSize:frame.size];
        self.layer.mask = layer;
    }
    return self;
}

- (void)setText:(NSString *)text{
    self.lable.text = text;
}

- (void)setImage:(UIImage *)image{
    self.imageView.image = image;
}

//根据dialogMode生成backgroundView
- (void)setDialogMode:(DialogMode)dialogMode{
    if (self.backgroundView == nil) {
        self.backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
        [self addSubview:self.backgroundView];
    }
    if (dialogMode == value1) {
        if (self.lable == nil) {
            self.lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
            self.imageView.hidden = YES;
            [self.backgroundView addSubview:self.lable];
        }
        if (self.text.length > 0) {
            self.lable.text = self.text;
        }
        
    }else if (dialogMode == value2){
        if (self.imageView == nil) {
            self.lable.hidden = YES;
            self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
            [self.backgroundView addSubview:self.imageView];
        }
        if (self.image) {
            [self.imageView setImage:_image];
        }
        
    }else if (dialogMode == value3){
        if (self.imageView == nil) {
            self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _size.width, _size.height*0.6)];
            [self.backgroundView addSubview:self.imageView];
        }
        if (self.image) {
            [self.imageView setImage:_image];
        }
        
        
        if (self.lable == nil) {
            self.lable = [[UILabel alloc]initWithFrame:CGRectMake(0, self.imageView.frame.origin.y+self.imageView.frame.size.height, _size.width, _size.height-(self.imageView.frame.origin.y+self.imageView.frame.size.height))];
            [self.backgroundView addSubview:self.lable];
        }
        if (self.text.length > 0) {
            self.lable.text = self.text;
        }
        
        
    }else{
        if (self.lable == nil) {
            self.lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _size.width, _size.height*0.4)];
            [self.backgroundView addSubview:self.lable];
        }
        if (self.text.length > 0) {
            self.lable.text = self.text;
        }
        
        
        if (self.imageView == nil) {
            self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.lable.frame.origin.y+self.lable.frame.size.height, _size.width, _size.height-(self.lable.frame.origin.y+self.lable.frame.size.height))];
            [self.backgroundView addSubview:self.imageView];
        }
        if (self.image) {
            [self.imageView setImage:_image];
        }
        
    }

}

//获取layer
- (CAShapeLayer *)drawDialogBox:(DialogBoxDirection)direction andRatio:(CGFloat)ratio andSize:(CGSize)size{

    self.direction = direction;
    self.ratio = ratio;
    self.size = size;
    
    UIBezierPath *bezierPath = [self drawDialogBox];
    CAShapeLayer  *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    
    return layer;
}

//绘制bezierPath尖角对话框
- (UIBezierPath *)drawDialogBox{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    if (_ratio>=1) {
        _ratio = 1;
    }else if (_ratio <= 0){
        _ratio = 0;
    }
    if (_direction == left) {
        [bezierPath moveToPoint:CGPointMake(0, _size.height*_ratio)];
        [bezierPath addLineToPoint:CGPointMake(15, _size.height*_ratio)];
        [bezierPath addLineToPoint:CGPointMake(15, _size.height+15)];
        [bezierPath addLineToPoint:CGPointMake(15+_size.width, _size.height+15)];
        [bezierPath addLineToPoint:CGPointMake(15+_size.width, 0)];
        [bezierPath addLineToPoint:CGPointMake(15, 0)];
        [bezierPath addLineToPoint:CGPointMake(15, _size.height*_ratio+15)];
        
    }else if (_direction == right){
        [bezierPath moveToPoint:CGPointMake(0, 0)];
        [bezierPath addLineToPoint:CGPointMake(0, _size.height)];
        [bezierPath addLineToPoint:CGPointMake(_size.width-15, _size.height)];
        [bezierPath addLineToPoint:CGPointMake(_size.width-15, _size.height*_ratio+15)];
        [bezierPath addLineToPoint:CGPointMake(_size.width, _size.height*_ratio)];
        [bezierPath addLineToPoint:CGPointMake(_size.width-15, _size.height*_ratio)];
        [bezierPath addLineToPoint:CGPointMake(_size.width-15, 0)];
        
    }else if (_direction == top){
        [bezierPath moveToPoint:CGPointMake(_size.width*_ratio, 0)];
        [bezierPath addLineToPoint:CGPointMake(_size.width*_ratio, 15)];
        [bezierPath addLineToPoint:CGPointMake(0, 15)];
        [bezierPath addLineToPoint:CGPointMake(0, _size.height+15)];
        [bezierPath addLineToPoint:CGPointMake(_size.width, _size.height+15)];
        [bezierPath addLineToPoint:CGPointMake(_size.width, 15)];
        [bezierPath addLineToPoint:CGPointMake(_size.width*_ratio+15, 15)];
    }else if (_direction == bottom){
        [bezierPath moveToPoint:CGPointMake(0, 0)];
        [bezierPath addLineToPoint:CGPointMake(0, _size.height-15)];
        [bezierPath addLineToPoint:CGPointMake(_size.width*_ratio, _size.height-15)];
        [bezierPath addLineToPoint:CGPointMake(_size.width*_ratio, _size.height)];
        [bezierPath addLineToPoint:CGPointMake(_size.width*_ratio+15, _size.height-15)];
        [bezierPath addLineToPoint:CGPointMake(_size.width+15, _size.height-15)];
        [bezierPath addLineToPoint:CGPointMake(_size.width+15, 0)];
    }
    
    bezierPath.lineWidth = 5;
    [bezierPath stroke];
    [bezierPath addClip];
    [bezierPath closePath];
    
    return bezierPath;
}


- (void)drawRect:(CGRect)rect {
    
}


@end
