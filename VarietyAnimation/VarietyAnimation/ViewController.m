//
//  ViewController.m
//  VarietyAnimation
//
//  Created by 杨彤 on 2018/11/14.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import "ViewController.h"
#import "AnimationManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
    [view setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:view];
    
//    [view.layer addAnimation:[[AnimationManager animationManager] pathAnimationWithEndPoint:CGPointMake(200, 300) startPoint:CGPointMake(70, 70)] forKey:@"twynkle"];
    
    [view.layer addAnimation:[[AnimationManager animationManager] groupAnimationWithStartPoint:CGPointMake(70, 70) endPoint:CGPointMake(200, 500) animationTime:3] forKey:@"hhhh"];
    
}


@end
