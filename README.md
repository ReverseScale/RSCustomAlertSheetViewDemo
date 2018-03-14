# RSCustomAlertView

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-1.9MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

[EN](#Requirements) | [中文](#中文说明)

Daily development often encounters "simple" needs such as adding an image to the Alert or changing the color of the button. Today, it brings a packaged component that is highly similar to the system components and can fully meet the customization requirements.

|1.List page | 2.System style | 3.Graphic style | 4.Custom style | 5.Bottom popup |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/51681420.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/24254780.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/25821896.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/97719663.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/52885630.jpg) |
| Built-in basic framework through storyboard | Customizable system style pop-up window | Customizable graphic style pop-up window | Customized style pop-up window | Custom bottom popup window |


### 🚀 Getting started
* 1. Less files, simple code
* 2. Does not rely on any other third party library
* 3. Fully customized features
* 4. Cross-version usage scenarios


### 🤖 Requirements
* iOS 7+
* Xcode 8+


### 🛠 Configuration
### Import header files
```Objective-C
#import "SMAlert.h"
```
### Simple call
System alert style:
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
            [SMAlert showContent:@"\nAre you sure you want to clear the cache?\n" confirmButton:[SMButton initWithTitle:@"sure" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"cancel" clickAction:nil]];
            break;
        case SingleButton:
            [SMAlert showContent:@"Hellow" confirmButton:[SMButton initWithTitle:@"sure" clickAction:^{
                [SMAlert hide];
            }]];
            break;
        default:
            [SMAlert showContent:@"Hello words~"];
            [SMAlert hideCompletion:^{
                NSLog(@"===2");
            }];
            break;
    }
}
```

Graphic reminder style

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
            [SMAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"Hello words！" confirmButton:[SMButton initWithTitle:@"sure" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"cancel" clickAction:nil]];
            break;
        case SingleButton:
            [SMAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"hello words！" confirmButton:[SMButton initWithTitle:@"sure" clickAction:^{
                [SMAlert hide];
            }]];
            break;
        default:
            [SMAlert showImage:[UIImage imageNamed:@"function_img_remind"] content:@"Hello words~"];
            break;
    }
}
```

Custom alert style

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
    title.text = @"place input someone";
    [customView addSubview:title];
    
    switch (style) {
        case DounleButton:
            [SMAlert showCustomView:customView confirmButton:[SMButton initWithTitle:@"sure" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"cancel" clickAction:nil]];
            break;
        case SingleButton:
            [SMAlert showCustomView:customView confirmButton:[SMButton initWithTitle:@"sure" clickAction:^{
                [SMAlert hide];
            }]];
            break;
        default:
            [SMAlert showCustomView:customView];
            break;
    }
}
```


### ⚖ License

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### 😬 Contributions

* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io

---
# 中文说明

日常开发中经常遇到需要给 Alert 增加个图或者改个按钮颜色之类的“简单”需求，今天带来一款和系统部件高度相似又能充分满足定制化需求的封装部件。

|1.列表页 |2.系统样式 |3.图文样式 |4.自定义样式 |5.底部弹窗 |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/51681420.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/24254780.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/25821896.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/97719663.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-14/52885630.jpg) |
| 通过 storyboard 搭建基本框架 | 可定制系统样式弹窗 | 可定制图文样式弹窗 | 自定义样式弹窗 | 自定义底部弹窗 |


### 🚀 准备开始
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.充分的定制化功能
* 4.跨版本的使用场景


### 🤖 要求
* iOS 7+
* Xcode 8+


### 🛠 配置
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


### ⚖ 协议

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### 😬  联系

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io
