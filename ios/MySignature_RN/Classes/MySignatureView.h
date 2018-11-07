//
//  MySignatureView.h
//  WealthMobile
//
//  Created by 耐克了解了 on 6/11/18.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>
#import <React/UIView+React.h>

NS_ASSUME_NONNULL_BEGIN

@interface MySignatureView : UIView

@property (nonatomic, copy) RCTBubblingEventBlock onSaveSignatureClick;


-(void)addPA:(CGPoint)nPoint;

-(void)addLA;

-(void)revocation;

-(void)refrom;

-(void)clear;

-(void)setLineColor:(NSInteger)color;

-(void)setlineWidth:(NSInteger)width;

@end

NS_ASSUME_NONNULL_END
