//
//  ViewController.m
//  ChartPOC
//
//  Created by Lineker Tomazeli on 11/10/2013.
//  Copyright (c) 2013 Lineker Tomazeli. All rights reserved.
//

#import "ViewController.h"
#define EMPTY_WEB_VIEW        @"<!DOCTYPE html>                             \
<html>                                      \
<head>                                  \
</head>                                 \
<body>                                  \
<div id=\"container\" style=\"width:%fpx;height:%fpx;position:absolute;left:50%%;top:50%%;margin-left:-%fpx;margin-top:-%fpx;\">              \
</div>                              \
</body>                                 \
</html>"


@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController
@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate = self;
    
    //NSString *htmlString = @"iOS 6 Programming <strong>Cookbook</strong>";
    //[self.webView loadHTMLString:htmlString baseURL:nil];
    
    //NSURL *url = [NSURL URLWithString:@"http://www.apple.com"]; NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //[self.webView loadRequest:request];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
 */

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
    
        NSString* format = EMPTY_WEB_VIEW;
        NSString* html = [NSString stringWithFormat: format,
                          CGRectGetWidth(self.webView.frame),
                          CGRectGetHeight(self.webView.frame),
                          CGRectGetWidth(self.webView.frame)/2.f,
                          CGRectGetHeight(self.webView.frame)/2.f];
        
        [self.webView loadHTMLString: html baseURL: nil];
    
    
    
    /* Option 1: working
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"graph" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlFile];
    
    [self.webView loadHTMLString:htmlString baseURL:baseURL];
     */

}

#pragma mark - OLDUIWebViewDelegate
 - (void) webViewDidFinishLoad:(UIWebView *)webView {
     NSLog(@"webViewDidFinishLoad");
    //self.seriesArray = [[NSArray alloc] initWithObjects:@"100",@"150","250", nil];
    //self.optionFileName = @"data.json";
    //NSParameterAssert(self.optionFileName);
     //NSParameterAssert(self.seriesArray);
    
    __autoreleasing NSError* error = nil;
    
    //Load jQuery
    NSString* jQueryPath = [[NSBundle mainBundle] pathForResource: @"jquery-1.10.2.min" ofType: @"js"];
    NSString* jQuery = [NSString stringWithContentsOfFile: jQueryPath encoding: NSUTF8StringEncoding error: &error];
    NSAssert(!error, @"Error loading jQuery: %@", error);
    [self.webView stringByEvaluatingJavaScriptFromString: jQuery];
    
    //Load HighChart
    NSString* highChartPath = [[NSBundle mainBundle] pathForResource: @"highcharts" ofType: @"js"];
    NSString* highChart = [NSString stringWithContentsOfFile: highChartPath encoding: NSUTF8StringEncoding error: &error];
    NSAssert(!error, @"Error loading highchart: %@", error);
    [self.webView stringByEvaluatingJavaScriptFromString: highChart];
    
   
    //Load theme
    //NSString* themePath = [[NSBundle mainBundle] pathForResource: @"theme" ofType: @"js"];
    //NSString* theme = [NSString stringWithContentsOfFile: themePath encoding: NSUTF8StringEncoding error: &error];
    //NSAssert(!error, @"Error loading theme: %@", error);
    NSString* theme = @"";
    //Load this graph object
    NSString* optionPath = [[NSBundle mainBundle] pathForResource: @"init" ofType: @"js"];
    NSString* formatInit = [NSString stringWithContentsOfFile: optionPath encoding: NSUTF8StringEncoding error: &error];
    NSAssert(!error, @"Error loading init javascript: %@", error);
     NSLog(@"%@", formatInit);
    //NSData* json = [NSJSONSerialization dataWithJSONObject: self.seriesArray options: 0 error: &error];
    //NSAssert(!error, @"Error creating JSON string from %@", self.seriesArray);
    NSString* dataPath = [[NSBundle mainBundle] pathForResource: @"data" ofType: @"json"];
    NSString* json = [NSString stringWithContentsOfFile: dataPath encoding: NSUTF8StringEncoding error: &error];
     
    //NSString* graph = [theme stringByAppendingFormat: formatInit, [[NSString alloc] initWithData: json encoding: NSUTF8StringEncoding]];
    NSString* graph = [theme stringByAppendingFormat: formatInit, json];
    NSAssert(!error, @"Error loading progress javascript: %@", error);
    
    [self.webView stringByEvaluatingJavaScriptFromString: graph];
    
}


@end
