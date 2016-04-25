//
//  YOSPlaceHolderTextView.m
//  YOSPlaceHolderTextViewTest
//
//  Created by yangyang on 16/4/21.
//  Copyright © 2016年 yy.inc. All rights reserved.
//

#import "YOSPlaceHolderTextView.h"

@interface YOSPlaceholderTextView()<UITextViewDelegate>

@property (nonatomic, weak) id <UITextViewDelegate>textViewDelegate;

@end

@implementation YOSPlaceholderTextView {
    UILabel *_placeholderLabel;
}

#pragma mark - life cycle

- (instancetype)initWithDelegate:(id)delegate {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    self.textViewDelegate = delegate;
    
    [self setupSubviews];
    
    return self;
}

- (void)setupSubviews {
    _placeholderLabel = [UILabel new];
    
    // important
    self.delegate = self;
    
    [self addSubview:_placeholderLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    
    CGFloat top = self.textContainerInset.top;
    CGFloat left = self.textContainerInset.left;
    CGFloat right = self.textContainerInset.right;
    
    // magic number 5.5 = 4 + 2
    //caret : {{4, 7}, {2, 15.300000000000001}}
    CGSize size = [_placeholder boundingRectWithSize:CGSizeMake(width - left - 5.5 - right, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [self _currentPlaceholderFont]} context:nil].size;
    
    CGRect frame = CGRectMake(left + 5.5, top, ceil(size.width), ceil(size.height));
    
    _placeholderLabel.frame = frame;
    
    _placeholderLabel.font = [self _currentPlaceholderFont];
    
    _placeholderLabel.numberOfLines = 0;
    
    _placeholderLabel.textColor = [self _currentPlaceholderColor];
}

#pragma mark - getter & setter

- (void)setText:(NSString *)text {
    [super setText:text];
    
    if (self.text.length) {
        _placeholderLabel.hidden = YES;
    } else {
        _placeholderLabel.hidden = NO;
    }
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    
    _placeholderLabel.text = _placeholder;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    _placeholderFont = placeholderFont;
    
    _placeholderLabel.font = _placeholderFont;
}

#pragma mark - private methods

- (UIColor *)_currentPlaceholderColor {
    if (self.placeholderColor) {
        return self.placeholderColor;
    } else {
        return [[UIColor lightGrayColor] colorWithAlphaComponent:0.7];
    }
}

- (UIFont *)_currentPlaceholderFont {
    if (self.placeholderFont) {
        return self.placeholderFont;
    } else {
        return [UIFont systemFontOfSize:12.0];
    }
}

#pragma mark - delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    BOOL status = YES;
    if ([self.textViewDelegate respondsToSelector:@selector(textViewShouldBeginEditing:)]) {
        status = [self.textViewDelegate textViewShouldBeginEditing:textView];
    }
    
    return status;
    
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    
    BOOL status = YES;
    if ([self.textViewDelegate respondsToSelector:@selector(textViewShouldEndEditing:)]) {
        status = [self.textViewDelegate textViewShouldEndEditing:textView];
    }
    
    return status;
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    if ([self.textViewDelegate respondsToSelector:@selector(textViewDidBeginEditing:)]) {
        [self.textViewDelegate textViewDidBeginEditing:textView];
    }
    
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    if ([self.textViewDelegate respondsToSelector:@selector(textViewDidEndEditing:)]) {
        [self.textViewDelegate textViewDidEndEditing:textView];
    }
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    BOOL status = YES;
    if ([self.textViewDelegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        status = [self.textViewDelegate textView:textView shouldChangeTextInRange:range replacementText:text];
    }
    
    return status;
    
}

#pragma mark show or hide
- (void)textViewDidChange:(UITextView *)textView {
    // show or hide placeholder

    if (self.text.length) {
        _placeholderLabel.hidden = YES;
    } else {
        _placeholderLabel.hidden = NO;
    }
    
    if ([self.textViewDelegate respondsToSelector:@selector(textViewDidChange:)]) {
        [self.textViewDelegate textViewDidChange:textView];
    }
    
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    
    if ([self.textViewDelegate respondsToSelector:@selector(textViewDidChangeSelection:)]) {
        [self.textViewDelegate textViewDidChangeSelection:textView];
    }
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    
    BOOL status = YES;
    if ([self.textViewDelegate respondsToSelector:@selector(textView:shouldInteractWithURL:inRange:)]) {
        status = [self.textViewDelegate textView:textView shouldInteractWithURL:URL inRange:characterRange];
    }
    
    return status;
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange {
    
    BOOL status = YES;
    if ([self.textViewDelegate respondsToSelector:@selector(textView:shouldInteractWithTextAttachment:inRange:)]) {
        status = [self.textViewDelegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
    }
    
    return status;
    
}

@end
