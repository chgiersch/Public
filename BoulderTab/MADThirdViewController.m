//
//  MADThirdViewController.m
//  BoulderTab
//
//  Created by Chris Giersch on 10/18/12.
//  Copyright (c) 2012 Chris Giersch. All rights reserved.
//

#import "MADThirdViewController.h"

@interface MADThirdViewController ()

@end

@implementation MADThirdViewController
@synthesize thirdWebView;
@synthesize thirdSpinner;

// Load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString
{
    // The NSString passed should be a properly formed URL
    NSURL *url = [NSURL URLWithString:urlString]; //a NSURL object is initialized using a NSString object that is passed to the method
    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //constructs a NSURLRequest object from a NSURL object
    [thirdWebView loadRequest:request]; //loads a NSURLRequest object
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    thirdWebView.delegate=self;
    [self loadWebPageWithString:@"http://www.denvergov.org/"];
    // Do any additional setup after loading the view from its nib.
}

//UIWebViewDelegate method that is called when a web page begins to load
-(void)webViewDidStartLoad:(UIWebView *)webView;
{
    [thirdSpinner startAnimating]; //sends the startAnimating message to the spinner
}

//UIWebViewDelegate method that is called when a web page loads successfully
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [thirdSpinner stopAnimating]; //sends the stopAnimating message to the spinner
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setThirdWebView:nil];
    [self setThirdSpinner:nil];
    [super viewDidUnload];
}
@end
