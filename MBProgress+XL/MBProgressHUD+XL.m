//
//  MBProgressHUD+XL.m
//  MBProgress+XL
//
//  Created by 路 on 2018/5/29.
//  Copyright © 2018年 路. All rights reserved.
//

#import "MBProgressHUD+XL.h"

@implementation MBProgressHUD (XL)


+ (void)tip:(NSString *)msg{
    [self showTipToView:nil title:nil msg:msg mode:MBProgressHUDModeText animation:MBProgressHUDAnimationFade];
}


+ (void)dismiss{
    [self hideHUDForView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) {
        view = (UIView*)[UIApplication sharedApplication].delegate.window;
    }
    [self hideHUDForView:view animated:YES];
}


/**
 菊花展示
 */
+ (void)show{
    [self showTipToView:nil title:nil msg:nil mode:MBProgressHUDModeIndeterminate animation:MBProgressHUDAnimationFade];
}


+ (void)showTipToView:(UIView *)view title:(NSString *)title msg:(NSString *)msg mode:(MBProgressHUDMode)mode animation:(MBProgressHUDAnimation)animation
{
    if (view == nil)
    {
        view = (UIView *)[UIApplication sharedApplication].delegate.window;
    }
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = mode;
    hud.animationType = animation;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.detailsLabel.text = msg;
    hud.label.text = title;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.font = [UIFont systemFontOfSize:16];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
}

+ (void)showTipToView:(UIView *)view msg:(NSString *)msg duration:(CGFloat)duration completion:(MBProgressHUDCompletionBlock)completion
{
    if (view == nil)
    {
        view = (UIView *)[UIApplication sharedApplication].delegate.window;
    }
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.detailsLabel.text = msg;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        sleep(duration);
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            completion();
        });
    });
    
}


+ (void)showTipToView:(UIView *)view msg:(NSString *)msg img:(NSString *)img duration:(CGFloat)duration completion:(MBProgressHUDCompletionBlock)completion
{
    if (view == nil)
    {
        view = (UIView *)[UIApplication sharedApplication].delegate.window;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.square = YES;
    NSMutableArray *images = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [images addObject:image];
    }
    UIImageView *gifImageView = [[UIImageView alloc] init];
    gifImageView.animationImages = images; //获取Gif图片列表
    gifImageView.animationDuration = 1;     //执行一次完整动画所需的时长
    gifImageView.animationRepeatCount = 0;  //动画重复次数
    [gifImageView startAnimating];
    hud.customView = gifImageView;
    hud.bezelView.backgroundColor = [UIColor whiteColor];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        sleep(duration);
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            completion();
        });
    });
    
}


+ (void)showWaitToView:(UIView *)view
{
    // 设置正在刷新状态的动画图片
    NSMutableArray *images = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [images addObject:image];
    }
    [self showWaitToView:view imgs:images animationDuration:1];

}

+ (void)showWaitToView:(UIView *)view imgs:(NSMutableArray *)imgs animationDuration:(CGFloat)animationDuration{
    if (view == nil)
    {
        view = (UIView *)[UIApplication sharedApplication].delegate.window;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.backgroundColor = [UIColor whiteColor];
    hud.square = YES;
    UIImageView *gifImageView = [[UIImageView alloc] init];
    gifImageView.backgroundColor = [UIColor clearColor];
    gifImageView.animationImages = imgs;     //获取Gif图片列表
    gifImageView.animationDuration = animationDuration;     //执行一次完整动画所需的时长
    gifImageView.animationRepeatCount = 0;   //动画重复次数
    [gifImageView startAnimating];
    hud.customView = gifImageView;
    hud.bezelView.backgroundColor = [UIColor clearColor];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
}

@end
