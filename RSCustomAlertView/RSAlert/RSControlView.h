//
//  RSContentView.h
//  RSCustomAlertView
//
//  Created by WhatsXie on 2017/11/15.
//  Copyright © 2017年 R.S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSButton.h"

@interface RSControlView : UIView
@property (strong, nonatomic) UIColor *contentTextColor UI_APPEARANCE_SELECTOR;              // default is black
@property (strong, nonatomic) UIFont *contentFont UI_APPEARANCE_SELECTOR;                    // default is 15
@property (assign, nonatomic) CGFloat lineSpace UI_APPEARANCE_SELECTOR;                      // default is 4
@property (strong, nonatomic) UIColor *lineColor UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) NSTextAlignment contentTextAlignment UI_APPEARANCE_SELECTOR;    // default is NSTextAlignmentLeft


- (void)setupContent:(NSString*)content confirmButton:(RSButton*)confirmButton cancleButton:(RSButton*)cancleButton;

- (void)setupImage:(UIImage*)image content:(NSString*)content confirmButton:(RSButton*)confirmButton cancleButton:(RSButton*)cancleButton;

- (void)setupCustomView:(UIView*)view confirmButton:(RSButton*)confirmButton cancleButton:(RSButton*)cancleButton;

@end
