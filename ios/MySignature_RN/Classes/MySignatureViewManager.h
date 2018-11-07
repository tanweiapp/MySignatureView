//
//  MySignatureViewManager.h
//  WealthMobile
//
//  Created by 耐克了解了 on 6/11/18.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <React/RCTViewManager.h>
#import <React/RCTBridgeMethod.h>
#import <UIKit/UIKit.h>
#import "MySignatureView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MySignatureViewManager : RCTViewManager

@property (nonatomic,weak) MySignatureView *signatureView;


@end

NS_ASSUME_NONNULL_END
