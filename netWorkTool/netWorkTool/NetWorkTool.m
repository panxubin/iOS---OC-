//
//  NetWorkTool.m
//  AFN
//
//  Created by panxubin on 16/9/8.
//  Copyright © 2016年 panxubin. All rights reserved.
//

#import "NetWorkTool.h"
#import "AFNetworking.h"
//黑魔法，

@protocol AFNetworkingDelagete <NSObject>

@optional
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end

@interface NetWorkTool ()<AFNetworkingDelagete>

@end


@implementation NetWorkTool

+(instancetype)shareNetWorkTool
{
    static id _instanceType;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instanceType = [[NetWorkTool alloc]initWithBaseURL:nil];
        
    });
    return _instanceType;
}


- (void)retuest:(NSString *)URLString
         method:(NSString *)method
     parameters:(NSDictionary *)parameters
       callBack:(void(^)(id responsnose)) callBack
{
    
    //获取到更深一层的方法后，使用下面的方法，好处在于不需要进行判断
    [[self dataTaskWithHTTPMethod:method URLString:URLString parameters:parameters uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        callBack(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        callBack(error);
    //此处要加resume，具体为什么使用参考框架中的方法
    }] resume];
    
    
    //在没获取到更深入一层的方法之前，通过判断使用GET 或者 POST方法。
//    if ([method isEqualToString:@"GET"]) {
//        
//        [self GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            callBack(responseObject);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"%@",error);
//            callBack(error);
//        }];
//        
//    }
//
//    
//    if ([method isEqualToString:@"POST"]) {
//        
//        [self POST:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            callBack(responseObject);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"%@",error);
//            callBack(error);
//        }];
//        
//    }


}


@end











