//
//  MySignatureViewManager.m
//  WealthMobile
//
//  Created by 耐克了解了 on 6/11/18.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "MySignatureViewManager.h"
#import <React/RCTBridge.h>


@implementation MySignatureViewManager

RCT_EXPORT_MODULE()
RCT_EXPORT_VIEW_PROPERTY(onSaveSignatureClick, RCTBubblingEventBlock)
#pragma mark - Response
// 导出方法，桥接到js的方法返回值类型必须是void
/* 回调参数必须为两个，第一个为状态，第二个为参数 */
RCT_EXPORT_METHOD(saveSignatureImageWithresolver:(RCTResponseSenderBlock)callback){
   dispatch_sync(dispatch_get_main_queue(), ^{
     CGFloat scale = [UIScreen mainScreen].scale;
     // 开启位图上下文
     UIGraphicsBeginImageContextWithOptions(self.signatureView.bounds.size, NO, scale);
     
     // 获取位图上下文
     CGContextRef ctx = UIGraphicsGetCurrentContext();
     
     // 把控件的图层渲染到上下文
     [self.signatureView.layer renderInContext:ctx];
     
     // 获取图片
     UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
     NSData *data = UIImageJPEGRepresentation(image, 1.0f);
     
     NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
     
     NSLog(@"encodedImageStr==%@",encodedImageStr);
     
     // 关闭上下文
     UIGraphicsEndImageContext();
     NSString *callbackData = encodedImageStr; //准备回调回去的数据
     callback(@[[NSNull null],callbackData]);
   });
}

RCT_EXPORT_METHOD(removeSignatureImageWithresolver:(RCTResponseSenderBlock)callback){
  dispatch_sync(dispatch_get_main_queue(), ^{
    [self.signatureView clear];
    NSString *callbackData = @"success"; //准备回调回去的数据
    callback(@[[NSNull null],callbackData]);
  });
}


- (UIView *)view
{
  MySignatureView *signatureView = [[MySignatureView alloc] initWithFrame:CGRectZero];
  signatureView.backgroundColor = [UIColor redColor];
  self.signatureView = signatureView;
  return signatureView;
}

#pragma mark - 单纯的方法调用
RCT_EXPORT_METHOD(saveSignatureImage
{
  CGFloat scale = [UIScreen mainScreen].scale;
  // 开启位图上下文
  UIGraphicsBeginImageContextWithOptions(self.signatureView.bounds.size, NO, scale);
  
  // 获取位图上下文
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  
  // 把控件的图层渲染到上下文
  [self.signatureView.layer renderInContext:ctx];
  
  // 获取图片
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  NSData *data = UIImageJPEGRepresentation(image, 1.0f);
  
  NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
  
  NSLog(@"encodedImageStr==%@",encodedImageStr);

  // 关闭上下文
  UIGraphicsEndImageContext();
})



#pragma mark - 带回调的方法调用
- (void)saveSignaturePicture
{
  CGFloat scale = [UIScreen mainScreen].scale;
  // 开启位图上下文
  UIGraphicsBeginImageContextWithOptions(self.signatureView.bounds.size, NO, scale);
  
  // 获取位图上下文
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  
  // 把控件的图层渲染到上下文
  [self.signatureView.layer renderInContext:ctx];
  
  // 获取图片
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  NSData *data = UIImageJPEGRepresentation(image, 1.0f);
  
  NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
  
  NSLog(@"encodedImageStr==%@",encodedImageStr);
  
  // 关闭上下文
  UIGraphicsEndImageContext();
  if (!self.signatureView.onSaveSignatureClick) {
    return;
  }

  NSLog(@"oc did click %li", [self.signatureView.reactTag integerValue]);

  //  导出事件
  self.signatureView.onSaveSignatureClick(@{@"target": self.signatureView.reactTag,
                                  @"value": encodedImageStr});
}

@end
