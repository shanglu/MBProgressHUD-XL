//
//  ViewController.m
//  MBProgress+XL
//
//  Created by 路 on 2018/5/29.
//  Copyright © 2018年 路. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+XL.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fistBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"");
}

- (IBAction)juhua {
     [MBProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD dismiss];
    });
   
}


- (IBAction)secondBtn {
    [MBProgressHUD showTipToView:self.view msg:@"你中奖啦" duration:2 completion:^{
        NSLog(@"这里看看你中啥大奖");
    }];
}




- (IBAction)firstClick:(id)sender {
    [MBProgressHUD showTipToView:self.view msg:@"加载完成啦" duration:5 completion:^{
        NSLog(@"加载完成后执行");
    }];
}
- (IBAction)thirdBtn:(id)sender {
    
    [MBProgressHUD showTipToView:self.view msg:@"带图片哦" img:@"dropdown_loading_03" duration:5 completion:^{
    }];
}
- (IBAction)fourthBtn {
    [MBProgressHUD showWaitToView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
