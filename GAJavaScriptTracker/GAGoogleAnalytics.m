//
//  Created by Jason Lee on 12-10-26.
//  Copyright (c) 2012年 Taobao.com. All rights reserved.
//

#import "GAGoogleAnalytics.h"

@implementation GAGoogleAnalytics

@synthesize tracket;

- (GAGoogleAnalytics *) intiWithId:(NSString *)aAnalyticsId {
    GAGoogleAnalytics *ga = [super init];
    if (self) {
        ga.tracket = [GAJavaScriptTracker trackerWithAccountID:aAnalyticsId];
        #ifdef DEBUG
        ga.tracket.debug = NO;
        #endif
        ga.tracket.dryRun = NO;
        ga.tracket.anonymizeIp = NO;
        ga.tracket.batchSize = 1;
        ga.tracket.batchInterval = 0;
        
        [ga.tracket start];
        NSString *version = [NSString stringWithFormat:@"%@-%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
        NSLog(@"Trace app version: %@",version);
        [ga.tracket setCustomVar:1 withKey:GACustomVarAppVersion value:version];
    }
    return ga;
}

- (void) trackPageview: (NSString *) pageName  {
    NSError *err = nil;
    [tracket trackPageview:pageName withError:&err];
    if (err) {
        NSLog(@"------ trackPageview error: %@",[err description]);
    }
}

- (void) trackEvent:(NSString *)category action:(NSString *)action label:(NSString *)label {
    [tracket trackEvent:category action:action label:label value:-1 withError:nil];
}

- (void) setCustomVar: (int) varIndex withKey:(NSString *) key value: (NSString *) value {
    [tracket setCustomVar:varIndex withKey:key value:value];
}

- (void) stopTrack {
    if ([tracket isRunning]) {
        [tracket stop];
    }
}

- (void) startTrack {
    if (![tracket isRunning]) {
        [tracket start];
    }
}


@end
