//
//  ViewController.m
//  syncthing-ios
//
//  Created by liangwei on 2016/12/8.
//  Copyright © 2016年 liangwei. All rights reserved.
//

#import "ViewController.h"
#import "syncthing.h"

static ViewController* viewController;

void reloadWebView(){
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"--------Run Service------------");
        [viewController reloadWebView];
    });
}

@interface ViewController () <UIWebViewDelegate>
@property (retain, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    viewController = self;
    [self startSyncthing];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"-----------webViewDidStartLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"-----------didFailLoadWithError : %@", error.localizedDescription);
    sleep(1);
    [self reloadWebView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"-----------webViewDidFinishLoad");
}

- (void)startSyncthing {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"--------Run Service------------");
        StartSyncthing();
    });
}

- (void)reloadWebView {
    NSLog(@"--------reloadWebView------------");

    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:8384"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
