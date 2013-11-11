//
//  ViewController.h
//  ChartPOC
//
//  Created by Lineker Tomazeli on 11/10/2013.
//  Copyright (c) 2013 Lineker Tomazeli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSArray* seriesArray;
@property (copy, nonatomic) NSString* optionFileName;
@end
