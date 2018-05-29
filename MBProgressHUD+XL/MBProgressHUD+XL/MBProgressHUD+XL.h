//
//  MBProgressHUD+XL.h
//  MBProgress+XL
//
//  Created by 路 on 2018/5/29.
//  Copyright © 2018年 路. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (XL)

/**
 文字提示语

 @param msg msg
 */
+ (void)tip:(NSString *)msg;

/**
 菊花消失
 */
+ (void)dismiss;

/**
 隐藏hud

 @param view 父视图View
 */
+ (void)hideHUDForView:(UIView *)view;


/**
 展示菊花
 */
+ (void)show;




/**
 网络请求动画框

 @param view 父视图
 */
+ (void)showWaitToView:(UIView *)view;


/**
 网络请求动画

 @param view 加载的view
 @param imgs 动画数组
 */

/**
 网络请求等待动画

 @param view 父视图
 @param imgs 图片数组
 @param animationDuration 完整动画时间
 */
+ (void)showWaitToView:(UIView *)view imgs:(NSMutableArray *)imgs animationDuration:(CGFloat)animationDuration;

+ (void)showTipToView:(UIView *)view title:(NSString *)title msg:(NSString *)msg mode:(MBProgressHUDMode)mode animation:(MBProgressHUDAnimation)animation;


+ (void)showTipToView:(UIView *)view msg:(NSString *)msg duration:(CGFloat)duration completion:(MBProgressHUDCompletionBlock)completion;


+ (void)showTipToView:(UIView *)view msg:(NSString *)msg img:(NSString *)img duration:(CGFloat)duration completion:(MBProgressHUDCompletionBlock)completion;
@end
