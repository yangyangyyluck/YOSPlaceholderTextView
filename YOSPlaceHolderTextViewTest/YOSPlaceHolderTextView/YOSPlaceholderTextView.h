//
//  YOSPlaceHolderTextView.h
//  YOSPlaceHolderTextViewTest
//
//  Created by yangyang on 16/4/21.
//  Copyright © 2016年 yy.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YOSPlaceholderTextView : UITextView

- (instancetype)initWithDelegate:(id <UITextViewDelegate>)delegate;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, strong) UIFont *placeholderFont;

@end
