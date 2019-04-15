# RSCustomAlertView

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-1.9MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

[EN](https://github.com/ReverseScale/RSCustomAlertSheetViewDemo) | [中文](https://github.com/ReverseScale/RSCustomAlertSheetViewDemo/blob/master/README_zh.md)

Daily development often encounters "simple" needs such as adding an image to the Alert or changing the color of the button. Today, it brings a packaged component that is highly similar to the system components and can fully meet the customization requirements.

|1.List page | 2.System style | 3.Graphic style | 4.Custom style | 5.Bottom popup |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| ![](https://s2.ax1x.com/2019/04/15/AXhLSe.png) | ![](https://s2.ax1x.com/2019/04/15/AXhHJO.png) | ![](https://s2.ax1x.com/2019/04/15/AXhbWD.png) | ![](https://s2.ax1x.com/2019/04/15/AXhOQH.png) | ![](https://s2.ax1x.com/2019/04/15/AXhXyd.png) |
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


