//
//  MADSecondViewController.m
//  BoulderTab
//
//  Created by Chris Giersch on 10/18/12.
//  Copyright (c) 2012 Chris Giersch. All rights reserved.
//

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController
@synthesize secondWebView;
@synthesize secondSpinner;

// Load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString
{
    // The NSString passed should be a properly formed URL
    NSURL *url = [NSURL URLWithString:urlString]; //a NSURL object is initialized using a NSString object that is passed to the method
    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //constructs a NSURLRequest object from a NSURL object
    [secondWebView loadRequest:request]; //loads a NSURLRequest object
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
    secondWebView.delegate=self;
    [self loadWebPageWithString:@"http://www.bouldercolorado.gov/"];
    // Do any additional setup after loading the view from its nib.
}

//UIWebViewDelegate method that is called when a web page begins to load
-(void)webViewDidStartLoad:(UIWebView *)webView;
{
    [secondSpinner startAnimating]; //sends the startAnimating message to the spinner
}

//UIWebViewDelegate method that is called when a web page loads successfully
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [secondSpinner stopAnimating]; //sends the stopAnimating message to the spinner
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setSecondWebView:nil];
    [self setSecondSpinner:nil];
    [super viewDidUnload];
}
@end
