//
//  AnimationManager.h
//  VarietyAnimation
//
//  Created by 杨彤 on 2018/11/14.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AnimationManager : NSObject
+ (instancetype)animationManager;

- (CABasicAnimation *)twinkleAnimation;

- (CAKeyframeAnimation *)shakeAnimationWithTime:(CGFloat)times;

- (CABasicAnimation *)movementAnimationStartPoint:(CGFloat)startPoint endPoint:(CGFloat)endPoint animationTime:(CGFloat)time;

- (CABasicAnimation *)zoomAnimationWithScale:(CGFloat)scale animationTime:(CGFloat)time;

- (CAKeyframeAnimation *)pathAnimationWithEndPoint:(CGPoint)endPoint startPoint:(CGPoint)startPoint;

- (CAAnimationGroup *)groupAnimationWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint animationTime:(CGFloat)time;
@end

NS_ASSUME_NONNULL_END
