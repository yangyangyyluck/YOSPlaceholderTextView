//
//  ViewController.m
//  YOSPlaceHolderTextViewTest
//
//  Created by yangyang on 16/4/21.
//  Copyright © 2016年 yy.inc. All rights reserved.
//

#import "ViewController.h"
#import "YOSPlaceholderTextView.h"

@interface ViewController () <UITextViewDelegate>

@end

@implementation ViewController {
    YOSPlaceholderTextView *_textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    YOSPlaceholderTextView *textView = [[YOSPlaceholderTextView alloc] initWithDelegate:self];
    textView.placeholder = @"1231231231231231231231";
    _textView = textView;
    textView.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    [self.view addSubview:textView];
    
    textView.frame = CGRectMake(80, 80, 200, 100);
    textView.layer.borderColor = [UIColor blackColor].CGColor;
    textView.layer.borderWidth = 0.5;
    
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"aabababab");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
