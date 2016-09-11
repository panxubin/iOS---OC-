//
//  ViewController.m
//  AFN
//
//  Created by panxubin on 16/9/8.
//  Copyright © 2016年 panxubin. All rights reserved.
//  https://httpbin.org/get?name=xiaoming

#import "ViewController.h"
#import "AFNetworking.h"
#import "NetWorkTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //用系统原生的afn发送网络请求
    [self loadDataForTool];
    
    
    
}

-(void)loadData
{
    //使用AFN世界请求网络数据
  [[AFHTTPSessionManager manager]GET:@"https://httpbin.org/get?name=xiaoming" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      //打印响应数据
      NSLog(@"%@",responseObject);
      
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      //打印错误信息
      NSLog(@"%@",error);
  }];
}


//使用自己创建的工具类发送请求
-(void)loadDataForTool
{
    [[NetWorkTool shareNetWorkTool]retuest:@"https://httpbin.org/get?name=xiaoming" method:@"GET" parameters:nil callBack:^(id responsnose) {
        NSLog(@"%@",responsnose);
    }];


}





@end
