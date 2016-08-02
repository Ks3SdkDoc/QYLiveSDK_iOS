//
//  QYLiveEngine.h
//  SaaSPrj
//
//  Created by 张俊 on 7/14/16.
//  Copyright © 2016 ksyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYTypeDef.h"
#import "QYUserProfile.h"

/**
 *  QYLiveEngine 作为QYLiveSDK对外的接口类，使用者可以很方便的接入直播服务
 */
NS_CLASS_AVAILABLE_IOS(8_0) @interface QYLiveEngine : NSObject

+(instancetype)sharedInstance;
/*
 *  调用者必须先获取有效token，用于sdk和QYServer建立连接,
 *  关于如何获取token，请联系金山云
 *  @param token      用于连接QYServer的token
 *  @param object
 */
-(void)initWithToken:(NSString *)token andObject:(id)object;

/**
 *  connect之前需要调用initWithToken
 *  @param errorBlock 连接返回的block
 */
-(void)connect:(QYStatusBlock)errorBlock;

/**
 *  为了获得更好的用户体验，必须使用该接口同步用户信息(非重要信息, 头像、昵称、性别等)到QYServer
 * 该函数必须在connect成功之后调用才生效
 *  @param userProfile 用户信息
 *  @param errorBlock  同步信息block
 *
 */
-(void)syncUserProfile:(QYUserProfile *)userProfile
                 error:(QYStatusBlock)errorBlock;

/**
 *  进入直播场景页(热门直播列表)
 *
 *  @return 创建的直播场景页
 *  客户可以通过present或者modal的方式进入直播场景页，但需注意：
 *  通过modal方式进入场景直播页时，需要在直播场景页外包装一个UINavigationController，否则会影响后续界面跳转，示例代码如下：
 *  UIViewController *liveViewController = [[QYLiveEngine sharedInstance] enterMainScene:nil];
 *  UINavigationController *naviViewController = [[UINavigationController alloc] initWithRootViewController:liveViewController];
 *  [self presentViewController:naviViewController animated:YES completion:nil];
 */
-(UIViewController *)enterMainScene:(id)context;

/**
 *  用于监听sdk的连接状态
 *
 *  @param delegate 消息接收者
 */
-(void)setStatusChangeDelegate:(id<QYStatusChangeDelegate>)delegate;

/**
 *  QYLiveSDK可以处理直播相关的推送服务，当接收到推送后调用该方法即可
 *  sdk目前支持的推送包括
 *       1.关注开播消息提醒
 *       2.被关注的消息提醒
 *  @param message 推送消息
 */
-(void)dispatchPushMessage:(NSDictionary *)message;


/**
 *  是否开启log，暂不支持release版本的接口设置
 *
 *  @param isOn TRUE 开启 FALSE 关闭
 */
-(void)setLog:(BOOL)isOn;

//@property(nonatomic, copy)NSString *token;

/**
 *  客户需要设置该属性，以便接收分享事件
 */
//TODO  分享block待完善
@property(copy)QYShareBlock share;

#pragma mark -- 高级功能
/**
 *  内部测试使用
 *  如果客户集成了第三方推送，无需调用该接口
 *  设置推送的标识符号
 *
 *  @param identifier 设备标识符
 */
-(void)setPushIdentifier:(NSString *)identifier;

/**
 *  内部测试使用
 *  第三方登录事件回调
 */
@property(copy)QYThirdPartyLoginBlock thirdPartyLogin;

/**
 *  登出的block,在sdk内部调用
 */
@property(copy)QYLogOutBlock logOut;

@end


