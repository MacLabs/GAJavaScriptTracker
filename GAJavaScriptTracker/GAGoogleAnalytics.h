//
//  WWGoogleAnalytics.h
//  AliWangwang
//
//  Created by Jason Lee on 12-10-26.
//  Copyright (c) 2012年 Taobao.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GAJavaScriptTracker.h"

// 自定义变量名称
#define GACustomVarAppVersion @"AppVersion"

@interface GAGoogleAnalytics : NSObject {
    
}

@property (nonatomic, strong) GAJavaScriptTracker *tracket;

- (GAGoogleAnalytics *) intiWithId: (NSString *) aAnalyticsId;
// 记录页面浏览
- (void) trackPageview: (NSString *) pageName ;
// 记录页面事件，比如 Button Click
- (void) trackEvent:(NSString *)category action:(NSString *)action label:(NSString *)label;
- (void) setCustomVar: (int) varIndex withKey:(NSString *) key value: (NSString *) value;
// 停止跟踪
- (void) stopTrack;
// 开始跟踪
- (void) startTrack;
@end
