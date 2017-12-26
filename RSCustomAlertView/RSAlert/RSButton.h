//
//  RSButton.h
//  RSCustomAlertView
//
//  Created by WhatsXie on 2017/11/15.
//  Copyright © 2017年 R.S. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^RSAlertButtonClickAction)(void);

@interface RSButton : UIButton

+ (instancetype)initWithTitle:(NSString*)title clickAction:(RSAlertButtonClickAction)action;

@end
