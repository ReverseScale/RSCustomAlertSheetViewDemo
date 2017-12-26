//
//  RSButton.m
//  RSCustomAlertView
//
//  Created by WhatsXie on 2017/11/15.
//  Copyright © 2017年 R.S. All rights reserved.
//

#import "RSButton.h"
#import "RSAlert.h"

@interface RSButton()
@property (strong, nonatomic) RSAlertButtonClickAction action;
@end

@implementation RSButton

+ (instancetype)initWithTitle:(NSString*)title clickAction:(RSAlertButtonClickAction)action {
    RSButton *button = [RSButton new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setAction:action];
    [button addTarget:button action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
- (void)buttonClick {
    if (self.action) {
        self.action();
    }else{
        [RSAlert hide];
    }
}

@end
