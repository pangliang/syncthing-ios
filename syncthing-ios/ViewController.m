//
//  ViewController.m
//  syncthing-ios
//
//  Created by liangwei on 2016/12/8.
//  Copyright © 2016年 liangwei. All rights reserved.
//

#import "ViewController.h"
#import "syncthing.h"

@interface ViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self startSyncthing];
    
    [self reloadWebView];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"-----------didFailLoadWithError : %@", error.localizedDescription);
    [self reloadWebView];
}

- (void)startSyncthing {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"--------Run Service------------");
        StartSyncthing();
    });
}

- (void)reloadWebView {
    NSLog(@"--------reloadWebView------------");

    self.webView.delegate = self;
    [self loadRequestFromString:@"http://127.0.0.1:8384"];
}

- (void)loadRequestFromString:(NSString*)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
