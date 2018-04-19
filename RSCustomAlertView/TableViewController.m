//
//  TableViewController.m
//  RSCustomAlertView
//
//  Created by WhatsXie on 2017/11/15.
//  Copyright © 2017年 R.S. All rights reserved.
//

#import "TableViewController.h"
// Alert
#import "RSAlert.h"
#import "CustomAlertView.h"
// Sheet
#import "RSActionSheet.h"

@interface TableViewController ()<UITextFieldDelegate, RSActionSheetDelegate>
//自定义样式视图
@property (nonatomic, strong) CustomAlertView *customAlertView;
    
@property (nonatomic, strong) RSActionSheet *actionSheet;
    
@end

@implementation TableViewController

typedef enum ALERT_STYLE{
    DounleButton,
    SingleButton,
    NoButtons,
}ALERT_STYLE;

typedef enum SHEET_STYLE{
    SystemStyle,
    IconStyle,
    IconTextStyle,
}SHEET_STYLE;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)actionSheetActionWithType:(SHEET_STYLE)sheetType {
    switch (sheetType) {
        case 0:
            // 初始化 默认样式
            self.actionSheet = [[RSActionSheet alloc] initWithTitle:@"默认样式" sheetTitles:@[@"sheet1",@"sheet2",@"sheet3"] cancleBtnTitle:@"取消" sheetStyle:(RSActionSheetDefault) delegate:nil];
            break;
        case 1:
            // 图标样式 要为actionSheet的iconArr属性赋值
            self.actionSheet = [[RSActionSheet alloc] initWithTitle:@"图标" sheetTitles:nil cancleBtnTitle:@"取消" sheetStyle:(RSActionSheetIcon) delegate:nil];
            break;
        default:
            // 文字+图标样式 要为actionSheet的iconArr属性赋值
            self.actionSheet = [[RSActionSheet alloc] initWithTitle:@"图标+标题" sheetTitles:@[@"sheet1",@"sheet2",@"sheet3"] cancleBtnTitle:@"取消" sheetStyle:(RSActionSheetIconAndTitle) delegate:nil];
            break;
    }
    
    [self getActionSheetStyle];
    
    [self.actionSheet show];
}
    
- (void)getActionSheetStyle {
    
    /*
     * 设置Sheet样式
     */
    self.actionSheet.isCorner = YES;
    self.actionSheet.titleColor = [UIColor greenColor];
    self.actionSheet.titleHeight = 100;
    self.actionSheet.titlebgColor = [UIColor yellowColor];
    self.actionSheet.subtitlebgColor = [UIColor cyanColor];
    self.actionSheet.subtitleColor = [UIColor blackColor];
    self.actionSheet.canclebgColor = [UIColor greenColor];
    self.actionSheet.cancleHeight = 80;
    
    // 传入图片数组
    UIImage *icon1 = [UIImage imageNamed:@"test01"];
    UIImage *icon2 = [UIImage imageNamed:@"test02"];
    UIImage *icon3 = [UIImage imageNamed:@"test03"];
    self.actionSheet.iconArr = [NSMutableArray arrayWithObjects:icon1,icon2,icon3, nil];
    
    /*
     * 设置代理 也可在初始化时设置代理
     */
    self.actionSheet.delegate = self;
    
}

/*
 * ActionSheet 代理方法
 */
- (void)actionSheet:(RSActionSheet *)actionSheet clickButtonAtIndex:(NSInteger)buttonIndex{
    
    NSLog(@"点击了sheet%ld",(long)buttonIndex+1);
}

- (void)actionSheetCancle:(RSActionSheet *)actionSheet{
    
    NSLog(@"取消");
}

///系统提醒样式
- (void)systemAlertWith:(ALERT_STYLE)style {
    [RSAlert setAlertBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [RSAlert setConfirmBtBackgroundColor:[UIColor whiteColor]];
    [RSAlert setConfirmBtTitleColor:[UIColor blueColor]];
    [RSAlert setCancleBtBackgroundColor:[UIColor whiteColor]];
    [RSAlert setCancleBtTitleColor:[UIColor grayColor]];
    [RSAlert setContentTextAlignment:NSTextAlignmentCenter];
    
    switch (style) {
        case DounleButton:
            [RSAlert showContent:@"\n确定要清除缓存吗？\n" confirmButton:[RSButton initWithTitle:@"确定" clickAction:^{
                [RSAlert hide];
            }] cancleButton:[RSButton initWithTitle:@"取消" clickAction:nil]];
            break;
        case SingleButton:
            [RSAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[RSButton initWithTitle:@"确定" clickAction:^{
                [RSAlert hide];
            }]];
            break;
        default:
            [RSAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。"];
            [RSAlert hideCompletion:^{
                NSLog(@"===2");
            }];
            break;
    }
}
///图文提醒样式
- (void)graphicAlertWith:(ALERT_STYLE)style {
    [RSAlert setAlertBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [RSAlert setConfirmBtBackgroundColor:[UIColor colorWithRed:89/255.0 green:183/255.0 blue:255/255.0 alpha:1]];
    [RSAlert setConfirmBtTitleColor:[UIColor whiteColor]];
    [RSAlert setCancleBtBackgroundColor:[UIColor colorWithRed:131/255.0 green:146/255.0 blue:165/255.0 alpha:1]];
    [RSAlert setCancleBtTitleColor:[UIColor whiteColor]];
    [RSAlert setContentTextAlignment:NSTextAlignmentCenter];
    
    switch (style) {
        case DounleButton:
            [RSAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[RSButton initWithTitle:@"确定" clickAction:^{
                [RSAlert hide];
            }] cancleButton:[RSButton initWithTitle:@"取消" clickAction:nil]];
            break;
        case SingleButton:
            [RSAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"日月忽其不淹兮，春与秋其代序。" confirmButton:[RSButton initWithTitle:@"确定" clickAction:^{
                [RSAlert hide];
            }]];
            break;
        default:
            [RSAlert showImage:[UIImage imageNamed:@"function_img_remind"] content:@"日月忽其不淹兮，春与秋其代序。"];
            break;
    }
}
///自定义提醒样式
- (void)customAlertWith:(ALERT_STYLE)style {
    // 样式设定
    [RSAlert setAlertBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [RSAlert setConfirmBtBackgroundColor:[UIColor whiteColor]];
    [RSAlert setConfirmBtTitleColor:[UIColor redColor]];
    [RSAlert setCancleBtBackgroundColor:[UIColor whiteColor]];
    [RSAlert setCancleBtTitleColor:[UIColor blueColor]];
    
    // 从Xib加载View
    self.customAlertView = [[[NSBundle mainBundle]loadNibNamed:@"CustomAlertView"
                                                         owner:nil options:nil] lastObject];
    self.customAlertView.frame = CGRectMake(0, 0, self.view.frame.size.width - 30, 160);
    
    switch (style) {
        case DounleButton:
            [RSAlert showCustomView:self.customAlertView confirmButton:[RSButton initWithTitle:@"确定" clickAction:^{
                [RSAlert hide];
            }] cancleButton:[RSButton initWithTitle:@"取消" clickAction:nil]];
            break;
        case SingleButton:
            [RSAlert showCustomView:self.customAlertView confirmButton:[RSButton initWithTitle:@"立即开通" clickAction:^{
                [RSAlert hide];
            }]];
            break;
        default:
            [RSAlert showCustomView:self.customAlertView];
            break;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [self systemAlertWith:DounleButton];
                break;
            case 1:
                [self systemAlertWith:SingleButton];
                break;
            case 2:
                [self systemAlertWith:NoButtons];
                break;
            case 3:
                [self graphicAlertWith:DounleButton];
                break;
            case 4:
                [self graphicAlertWith:SingleButton];
                break;
            case 5:
                [self graphicAlertWith:NoButtons];
                break;
            case 6:
                [self customAlertWith:DounleButton];
                break;
            case 7:
                [self customAlertWith:SingleButton];
                break;
            default:
                [self customAlertWith:NoButtons];
                break;
        }
    } else {
        [self actionSheetActionWithType:indexPath.row];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
