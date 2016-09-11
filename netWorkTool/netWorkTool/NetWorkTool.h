//
//  NetWorkTool.h
//  AFN
//
//  Created by panxubin on 16/9/8.
//  Copyright © 2016年 panxubin. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetWorkTool : AFHTTPSessionManager

+(instancetype)shareNetWorkTool;

- (void)retuest:(NSString *)URLString
         method:(NSString *)method
     parameters:(NSDictionary *)parameters
       callBack:(void(^)(id responsnose)) callBack;



@end
