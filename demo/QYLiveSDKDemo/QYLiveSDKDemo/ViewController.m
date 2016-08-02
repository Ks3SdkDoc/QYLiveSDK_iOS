//
//  ViewController.m
//  QYLiveSDKDemo
//
//  Created by 张俊 on 7/19/16.
//  Copyright © 2016 qyvideo. All rights reserved.
//

#import "ViewController.h"

#import <QYLiveSDK/QYLiveSDK.h>


#define QYLIVE_TOKEN    @"MsxU2O2aCOTj143sYKPwY4kJAgs="

@interface ViewController ()

@property (nonatomic, assign) BOOL  isReady;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UINavigationBar appearance].translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"QYLiveSDK Demo";
    
    [[QYLiveEngine sharedInstance] initWithToken:QYLIVE_TOKEN andObject:nil];
    
    
    [[QYLiveEngine sharedInstance] connect:^(QYErrCode code, NSInteger what, NSString * _Nullable extra) {
        
        if (code == QYErrOk) {
        
            QYUserProfile *userProfile = [[QYUserProfile alloc] init];
            userProfile.uid = @"asdfghjkl";
            userProfile.nickName = @"贝吉塔";
            userProfile.profileIcon = @"http://test-huzilong.kss.ksyun.com/ObjectPrefix/201606071506258791";

            [[QYLiveEngine sharedInstance] syncUserProfile:userProfile error:^(QYErrCode code, NSInteger what, NSString * _Nullable extra) {
                
                if (code != QYShareSuccess) {
                    
                    NSLog(@"syncUserProfile error is %@",extra);

                }
            }];
        }else {
        
            NSLog(@"connect error is %@",extra);
        }
    }];

    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [enterButton setTitle:@"进入直播" forState:UIControlStateNormal];
    [enterButton setTitleColor:[UIColor colorWithRed:0.314 green:0.890 blue:0.761 alpha:1.00] forState:UIControlStateNormal];
    [enterButton.layer setBorderColor:[[UIColor colorWithRed:0.314 green:0.890 blue:0.761 alpha:1.00] CGColor]];
    [enterButton.layer setBorderWidth:1];
    enterButton.layer.masksToBounds = YES;
    enterButton.layer.cornerRadius = 6;
    [enterButton addTarget:self action:@selector(enterLive) forControlEvents:UIControlEventTouchUpInside];
    [enterButton setFrame:CGRectMake((screenSize.width - 120) / 2, 220, 120, 40)];
    [self.view addSubview:enterButton];
}

- (void)enterLive
{
   UIViewController *liveViewController = [[QYLiveEngine sharedInstance] enterMainScene:nil];

   [self.navigationController pushViewController:liveViewController animated:YES];
   // [self presentViewController:liveViewController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
    
    
-(BOOL)shouldAutorotate
{
    return NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end
