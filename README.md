# RSCustomAlertView
基于OC实现的自定义 Alert 弹窗
---
![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-1.9MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

日常开发中经常遇到需要给 Alert 增加个图或者改个按钮颜色之类的“简单”需求，今天带来一款和系统部件高度相似又能充分满足定制化需求的封装部件。

| 名称 |1.列表页 |2.系统样式 |3.图文样式 |4.自定义样式 |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-11-15/69387503.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-11-15/11757739.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-11-15/20992590.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-11-15/23432247.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 可定制系统样式弹窗 | 可定制图文样式弹窗 | 自定义样式弹窗 |


## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.充分的定制化功能
* 4.跨版本的使用场景


## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 第一步 引入头文件
```Objective-C
#import "SMAlert.h"
```
### 第二步 简单调用
系统提醒样式：
```Objective-C
- (void)systemAlertWith:(ALERT_STYLE)style {
    [SMAlert setAlertBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [SMAlert setConfirmBtBackgroundColor:[UIColor whiteColor]];
    [SMAlert setConfirmBtTitleColor:[UIColor blueColor]];
    [SMAlert setCancleBtBackgroundColor:[UIColor whiteColor]];
    [SMAlert setCancleBtTitleColor:[UIColor grayColor]];
    [SMAlert setContentTextAlignment:NSTextAlignmentCenter];
    
    switch (style) {
        case DounleButton:
            [SMAlert showContent:@"\n确定要清除缓存吗？\n" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"取消" clickAction:nil]];
            break;
        case SingleButton:
            [SMAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }]];
            break;
        default:
            [SMAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。"];
            [SMAlert hideCompletion:^{
                NSLog(@"===2");
            }];
            break;
    }
}
```

图文提醒样式

```Objective-C
- (void)graphicAlertWith:(ALERT_STYLE)style {
    [SMAlert setAlertBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [SMAlert setConfirmBtBackgroundColor:[UIColor colorWithRed:89/255.0 green:183/255.0 blue:255/255.0 alpha:1]];
    [SMAlert setConfirmBtTitleColor:[UIColor whiteColor]];
    [SMAlert setCancleBtBackgroundColor:[UIColor colorWithRed:131/255.0 green:146/255.0 blue:165/255.0 alpha:1]];
    [SMAlert setCancleBtTitleColor:[UIColor whiteColor]];
    [SMAlert setContentTextAlignment:NSTextAlignmentCenter];
    
    switch (style) {
        case DounleButton:
            [SMAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"取消" clickAction:nil]];
            break;
        case SingleButton:
            [SMAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }]];
            break;
        default:
            [SMAlert showImage:[UIImage imageNamed:@"function_img_remind"] content:@"日月忽其不淹兮，春与秋其代序。"];
            break;
    }
}
```

自定义提醒样式

```Objective-C
- (void)customAlertWith:(ALERT_STYLE)style {
    [SMAlert setAlertBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [SMAlert setConfirmBtBackgroundColor:[UIColor whiteColor]];
    [SMAlert setConfirmBtTitleColor:[UIColor redColor]];
    [SMAlert setCancleBtBackgroundColor:[UIColor whiteColor]];
    [SMAlert setCancleBtTitleColor:[UIColor blueColor]];
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 280, 150)];
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(15, 70, 250, 35)];
    textField.layer.borderWidth = 0.5;
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [textField setReturnKeyType:UIReturnKeyDone];
    textField.delegate = self;
    [customView addSubview:textField];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 250, 15)];
    [title setFont:[UIFont systemFontOfSize:15]];
    [title setTextColor:[UIColor darkGrayColor]];
    title.text = @"请输入内容";
    [customView addSubview:title];
    
    switch (style) {
        case DounleButton:
            [SMAlert showCustomView:customView confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"取消" clickAction:nil]];
            break;
        case SingleButton:
            [SMAlert showCustomView:customView confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }]];
            break;
        default:
            [SMAlert showCustomView:customView];
            break;
    }
}
```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSCustomAlertView 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
