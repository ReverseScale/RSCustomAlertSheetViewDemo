//
//  RSActionSheetCell.h
//  RSCustomAlertView
//
//  Created by WhatsXie on 2017/11/15.
//  Copyright © 2017年 R.S. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,RSActionSheetStyle){
    
    RSActionSheetDefault,
    RSActionSheetIconAndTitle,
    RSActionSheetIcon
};



@interface RSActionSheetCell : UITableViewCell

@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UIImageView *iconImg;
@property (nonatomic,strong)UIView *bottomLine;
@property (nonatomic,strong)UIView *coverView;

/**
 只有一个标题

 @param title 标题
 @param height cell高度
 */
- (void)setupRSActionSheetDefaultCellWithTitle:(NSString *)title
                                    CellHeight:(CGFloat)height;

/**
 图标+标题

 @param title 标题
 @param font 字体
 @param icon 图标
 @param height 高度
 */
- (void)setupRSActionSheetIconAndTitleWithTitle:(NSString *)title
                                      titleFont:(UIFont *)font
                                           icon:(UIImage *)icon
                                     cellHeight:(CGFloat)height;

/**
 只有一个图标

 @param icon 图标
 @param height 高度
 */
- (void)setupRSActionSheetIconAndTitleWithIcon:(UIImage *)icon
                                    cellHeight:(CGFloat)height;
@end
