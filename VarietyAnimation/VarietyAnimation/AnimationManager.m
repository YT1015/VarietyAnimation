//
//  AnimationManager.m
//  VarietyAnimation
//
//  Created by 杨彤 on 2018/11/14.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import "AnimationManager.h"

static AnimationManager *animation=nil;
@implementation AnimationManager
//单例
+ (instancetype)animationManager{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        animation=[[AnimationManager alloc] init];
    });
    
    return animation;
}
//闪烁
- (CABasicAnimation *)twinkleAnimation{//opacity
    
    CABasicAnimation *twinkleAnim=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    twinkleAnim.fromValue=[NSNumber numberWithFloat:0];
    
    twinkleAnim.toValue=[NSNumber numberWithFloat:1.f];
    
    twinkleAnim.duration=0.1f;
    
    twinkleAnim.repeatCount=MAXFLOAT;
    //设置动画z完成后停在最后的位置 要同时设置 fillMode=kCAFillModeForwards 与removedOnCompletion=NO 才起作用
    twinkleAnim.fillMode=kCAFillModeForwards;
    
    twinkleAnim.removedOnCompletion=NO;
    
    return twinkleAnim;
}
//抖动 (旋转)
- (CAKeyframeAnimation *)shakeAnimationWithTime:(CGFloat)times{//shake
    
     CAKeyframeAnimation *shakeAnim=[CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    shakeAnim.values=@[[NSNumber numberWithFloat:-M_PI/8],[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:M_PI/8],[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:-M_PI/8]];
    
    shakeAnim.duration=times;
    
    shakeAnim.fillMode=kCAFillModeForwards;
    
    shakeAnim.removedOnCompletion=NO;
    
    shakeAnim.repeatCount=MAXFLOAT;
    
    return shakeAnim;
}
//平移
- (CABasicAnimation *)movementAnimationStartPoint:(CGFloat)startPoint endPoint:(CGFloat)endPoint animationTime:(CGFloat)time{
    
    CABasicAnimation *movementAnim=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    movementAnim.fromValue=[NSNumber numberWithFloat:startPoint];
    
    movementAnim.toValue=[NSNumber numberWithFloat:endPoint];
    
    movementAnim.duration=time;
    
    movementAnim.fillMode=kCAFillModeForwards;
    
    movementAnim.removedOnCompletion=NO;
    
    return movementAnim;
}
//缩放
- (CABasicAnimation *)zoomAnimationWithScale:(CGFloat)scale animationTime:(CGFloat)time{
    
    CABasicAnimation *zoomAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    zoomAnimation.toValue=[NSNumber numberWithFloat:scale];
    
    zoomAnimation.duration=time;
    
    zoomAnimation.fillMode=kCAFillModeForwards;
    
    zoomAnimation.removedOnCompletion=NO;
    
    return zoomAnimation;
}
//路径（关键帧动画 path的优先级高于value）-----设置了path values就失去了作用
- (CAKeyframeAnimation *)pathAnimationWithEndPoint:(CGPoint)endPoint startPoint:(CGPoint)startPoint{
    
    CAKeyframeAnimation *pathAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    pathAnimation.duration=2;
    
    pathAnimation.fillMode=kCAFillModeForwards;
    
    pathAnimation.removedOnCompletion=NO;
    
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    [path moveToPoint:startPoint];
    
    [path addQuadCurveToPoint:endPoint controlPoint:CGPointMake(140, 140)];
    
    pathAnimation.path=path.CGPath;
    
//    pathAnimation.values=@[[NSValue valueWithCGPoint:CGPointMake(70, 70)],[NSValue valueWithCGPoint:CGPointMake(170, 90)],[NSValue valueWithCGPoint:CGPointMake(100, 60)],[NSValue valueWithCGPoint:CGPointMake(70, 70)],];
    
    return pathAnimation;
}
//组合
- (CAAnimationGroup *)groupAnimationWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint animationTime:(CGFloat)time{
    
    CAAnimationGroup *groupAnimation=[[CAAnimationGroup alloc] init];
    
    groupAnimation.duration=time;
    
    groupAnimation.fillMode=kCAFillModeForwards;
    
    groupAnimation.removedOnCompletion=NO;
    
    //旋转
    CABasicAnimation *shakeAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    shakeAnimation.fromValue=[NSNumber numberWithFloat:0];
    
    shakeAnimation.toValue=[NSNumber numberWithFloat:M_PI*2];
    
    shakeAnimation.duration=1;
    
    shakeAnimation.repeatCount=MAXFLOAT;
    //路径
    
    CAKeyframeAnimation *pathAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    [path moveToPoint:startPoint];
    
    [path addQuadCurveToPoint:endPoint controlPoint:CGPointMake((endPoint.x-endPoint.x)/2.0, ((endPoint.y-endPoint.y)/2.0)-30)];
    
    pathAnimation.path=path.CGPath;
    
    groupAnimation.animations=@[pathAnimation,shakeAnimation];
    
    return groupAnimation;
    
}
@end
