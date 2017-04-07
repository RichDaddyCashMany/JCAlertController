# JCAlertView

JCAlertView是对JCAlertController使用的一层封装，实际和UIAlertController一样继承于UIViewController。可以作为替代UIAlertController的一个UI库，使用更加简单。


| 比较  |队列管理   |   自定义样式 |  最低支持系统 |
| :----:   | :----:  | :----:  | :----:  |
| UIAlertController | 不支持 |  复杂 | iOS8|
| JCAlertController |  支持  |  简单 | iOS7|


* 自动队列化管理，无需关心控制器栈
* 支持自定义样式
* 支持自定义contentView
* 背景高斯模糊

### <a>自定义样式</a>
<img src="https://lh3.googleusercontent.com/oRczsDUr68_Nwg9dABtM4A-SM4TgOPCi6NY3qAUlDJvFIslcsvAGemaJyMIuId9ZPLBPrMkqsAzGXG-vRDo91n52Lqlnh8Pu5-B9N2lwJNpDO6-2Q1cJPHb2lek8QOPKXVV-YSIoW9_iUsx37lu8nbPKLOVr27VywnsQsPzXiggdQb2qHyLAZsOZtF28KFHysJBjaxPnPVv0gJ68h2uKvAI9t93YdhivTjO92Dka_3WIPJ1oRVm6aseJbn7ceHCTyRoZKYhm68grLfefKN8vSCPpDLp3r9mJQGP9lVkfk7vf3YX8349WDfM2WPJQ7j5lzbNQqMumN1a39gB1Kv52CER8gEbVwFkqwtQ_rBgWWz3VXtBJDJvcXQjy2nEJmssQnD4WAwa62Uxqdtz-mj2xpEMeK9P1Bqm3NrwQ9haV7WHc2aS2ImT91L20OjgvarzS1qfNZBnbrRe-pTQmgQHL5epGQSoDkonxEv4sCp5G-DxCr2x22nkAa8nIjx-0ys0MdNgqMpABDDNewKkzZfB1yw1H2ZKadg5-kVGD33WMq2IZUViD7hJxeCMtiF65YM74FQrBLEZspJzelzQBIA5eNEgTyCfx6Uye2X6G_O2VAOOlapnwix8=w640-h341-no" width="320">

### <a>默认样式</a>
<img src="https://lh3.googleusercontent.com/tJk9UnmamltIqkbZSGGZNo9M7m5P_2Ha_yDB97jr7fLqUitCm8Ex_AmI8JR57bEGeTXOUbf0LQgyNC3PMpK63O40XSRX6i8AuBkngrABWJRadYRQVvAYvYKFgzEWvP9yy_IvcgV0I_-lx54CUBUT10Y81KiIYWOnfYcGUXrTX4Q0M1rs0NIGanqI6DN2sjfTE3qvZyFmyaUIjxYGRPzcG_nKvDwKhGUm2OS_rDkwQjgrm_INhG79cXqLs-t9geiTMc23yp_JMOMXWoys_tAkNns9rsNwhse1iyYiUQxRbEbkVd_l6tCWJcPGXZv4Gmzbt7q4N4Bok9s_QS9_Mh3tAbf6ZptR3rWcel6PlGWVdjMMuaOUuE6S0ng5CrLN1ioLm9X3N9_sDNgDbIrBtS88e4SJUDnuL-8tphJ8eO6PLdBvw1H1SGJQQP7WjrbDgwBJ0jZ40GJdDulUqqxTsg5-qqkWvCknZ1pCleStnFgKWloZij3WoPVGS8nQVqksM4NBjPItJ6TpQ3IXUtIxlYtJNl90-iRLuyy-EtAHGqV5Cm8_HBdZCzjpLE4M6ISlqTf5JRIy4RAHm_l-hH5Fxb2XKRjfBhHhmuP_JAdulArX0iHubsx4qaI=w640-h344-no" width="320">

### <a>默认样式（只有title）</a>
<img src="https://lh3.googleusercontent.com/pZV5jfi5Ddy4y_cqRcfxD0H7tT6JiHvTBKVXK_h2ayYYjJtDjbNDfH-Rvl4utlVc1X4nowCRUPzjzkowDWMgttKzzEMLP57FRaNph0QdMbbqGrmf9EA0UhBAz-9ACdzn94Wy83_hpk74RegMLCMhw32csbCsnhypjOJ2JbAQNCQKH-sxE5gUYBHHgPXbMPo2n_p3TtZN24dcQSosxI2piHbkHRyTwWJJH909k2DwjIRQDQTT9uxuaoDfyCLSf138VtTkonhZxHmWRUOzQ6ZBlQ_kHv2gU0Nw5yFHhye3YDFOr0552Os9_OcYnVhWH9i2rSIYSvpqL6spELTh5IVRSQXAiSc_2YeRE3SBP91IvH0bvgPuObk-9hD6me0LgKvn20aFIfjbtq_0D8InnsEy4kW-AaLyCP22jB7o9pcLN5CMIYvb1P4AYG3HbPDhQ56pvdJd0e3gq_OJLcjv3dAmgZ07nd_xrWpw0F0MVWgf2ZyhVVh8IwRSHwwh5plx5RatMaDlUyvIs6dMkf8Q2iqr_mlWZHPcCDokeojMa9wp2XNqo76feM7wbR0wHUFbyhiX59phHWfKwlHcURbB2uqRorKeM6Vjjg-ZpFu03Cb2-vvWaUY=w640-h341-no" width="320">

### <a>默认样式（只有content）</a>
<img src="https://lh3.googleusercontent.com/XrDvHssJJMK1aOIqFLAyYKrzZ1ZVo1QF3WTxMtZ7EHVq6V6GicmJwKr8Xoo8B0gqY3yYgqQhRcz0OtWaMVhwKyUHPonvRbOBvqrN01BQmEjNdRbVacIZUz3sr-cXWYfhILILDxLsRQZe0DmyobZTs7gSsDXNwtOWYxkOXv8N_evKqFihH7fwRiLATiMeuoYjuoBondYNdMLLfZyKnunj4ihG7zlJUmaF9bcoWD6poQmUWyooEKUuaZgmc9Ll3tZZIBZ0LOt4jXxJWxYxvuFzELwxJlYnV_tPRhkbRvMaSsfHLW4E2d305ZKq1DTTeAHjGwgFEhTig2AXz8WzmqqLNw9X1i3K0xiU5qgNqw1otBwMLkcYUWBMR09193ydz-6B_uaMF5_IRrvmBojBDFr02pkKPZpP6_Wwn4z9Qort1oqw7pxVJKlLwx26yjvc2H7o_wlLeK6GgKcZ--jryVUX8fDtwJKppCrWzFjoj6siH9Zcqed7kqY0whm1p6CjTeMFQ6RpoOt-JkY-YWxOYe0q35r01ZuDvK21nbJLEXRSNM1H52vJMEePLVmHhbcY08sBB_7oTh_4Oxq1pwRUX2y_pnTA-VMk0sQZwczo_TFKQmk0Myw=w640-h344-no" width="320">


### <a>自定义contentView</a>
<img src="https://lh3.googleusercontent.com/RvSEetzH0mvkYcP9J3mK-Zfd3qF2ZafHlF9HgtCr9O3NEsesTb-sULXbAuI2YqXbUuMtrmvokioP8jKlcu8unhHfP7ypjaoJt1TKDsScVHdXMRM6FZ1POLrbEyA0X9hX-SMfzFgqfcO8m0K9WcBtzWn7QZjqqFgqz35GlEqAaQUn_FbDPfl4tjFBclaqpU-XbW4hZUHj7iu5_OwGQZrxqoFpxY7H8KPUt1ZN2GHZcgAzK2b8kGLnnIBJx6jc4KYA6NAEcn_aSKc67DyxPcnxUSG2dWnzl3JPjjwxXQO0JHTNB_fFzwSLp7Ic5dYIaFEYNN45ckdoVrKcdwf-g1UXtbTK-DEqENsMjSPZzz6xTyUtWMb2Wvu8Ghgg5oT4Noy51WbU8t-WctWLnLAkDximo8Je6yFEhGNuChEdSUyrhIY1xjZNxJQpkMEmnZLk84NWF_PgP_au32JGIoeVr_tjh_psFFXx8yQ3buOo7DoOrdqKOwKw_4ZOgyLKspEbaw5ukuKrdYGvlJ-SifO-CSvmtD7KHys7XUOsQ6oLYzBAunf6bFeRTc6f1ElNATZ2M1hdY2Zv4YAEiXQFl93YufOt0bLP2wpi9U8hcJ0tfVo-EfExzfg=w640-h390-no" width="320">

### <a>自定义contentView</a>
<img src="https://lh3.googleusercontent.com/TZp5MtGqB-X9nEkWvk3RGsUvwu6z3CzMAFeZ5926B6AfVbMgpHyWGqCqc7OYv0lmj2zOkgxg8s7n_ZJ6ICWqIsIOJNVuU-WukwCQ2ljQBHaM9hmLnosRTwpq3QfSWX9Kg21rCMWwYzwizrAt_Po2laRH-kzQ-M-ae4CWMPkwJUKqoCeSmYx5526S1I3LJ6qLOKPhzkf7W987MG5ZU8QWYWeibAGGOeq3uLJCLRnqfbEtQJgdMKvuRkz9U5fxfHQI2nze4QazEt3IFCvXRUW-E_IlJ7JSF8DRzHX4P6X5O-CMfRMc9ZLEBadc1hp547XrDr8gqLiAZ9wdoW5l_KKGzIAd0MXwWb3sU80qg9Kx0MV3h0Q-AakGhcvE0EY-OetgOX0_lDux2ylSU2bAE3QVFi2NWg6mbCzQnLZCJ4jGTVUMuFxh7Lfh9WJq3ZBNZ25XAtXkbHrBd3Ky8nAxcw4I4i_5S_gpUog9-sL3GQNTLLdfHY9nbIoqulrD9dzIU8ZrGeIM-Wi_2zZmcU4r16DCKnwLkdO8AJS3AXUx1IkLT-VDe_kige7zo6WZTfxPynxMpYinLwKGIz-Dc0nZVhYiBTUHyXF8lPxyeY7xTPgKIHedVbI=w640-h1136-no" width="320">

### <a>自定义contentView+键盘处理</a>
<img src="https://lh3.googleusercontent.com/vezwy8V1NhwSEaUxswnES0e89JNQwF7RwFW16ZhVBGqt5sXAFf0r01-X1nSJlJbhtFnJqdkCqnLvEVcwXo6g4Y-_tOnKX0mYtICeFa8_9s_P9V53LK_EmTOaWQvowXPXx_7M4DzUExdSbVJMV2gqJ3PRul1ySWS_M4c56XDZNkI-Lp7c0J_pMNju_eULDXBgQ2LQFF60w8MM4KtBbwurwPCTAP3mVR0gxoBuhAl2K_STkGoY-6RMceDcKyTqwdP5H_JHNPaJ8xP5nCXGpudTRTGxl9qrBWbn_cHcOwE4Tg3D3cuX6AQAgJTwE8ksZbWcfBLHgujHTembAJbGGCBHi_Z8w4sJY3HN8jRM1luTntcWOFEEIvAhMnSS3Tn76Y3dt2LobC9oKbLu6LYoofNy1l5tHlVxeMFbzjNl5MwjDOZ9rpKHR6HTlwUeGEtL9294lUufo460RLGBkN_6PesNmtjlvl2pZc9QYSdhcfKx7SEYMA9B0_bNqU6Ab-fD4-Gy-9CjuBoBOKTej6m_Vpx1LbzrXTlu0T5fScoxsAzaFVIsYAYkWQgdmjm5Y8LJ5TovDaqvkVKqeX9fvDduN3meap5y9wbxQOCU7GqFevNDRdercD4=w640-h1136-no" width="320">


## 文件结构

```objc
.
|____AlertController // 和UIAlertController同级的控制器
| |____JCAlertController.h
| |____JCAlertController.m
|____AlertView // JCAlertController中的弹出层
| |____JCAlertNormalView.h
| |____JCAlertNormalView.m
|____ButtonItem // 按钮模型
| |____JCAlertButtonItem.h
| |____JCAlertButtonItem.m
|____Category // 分类
| |____NSAttributedString+JCCalculateSize.h
| |____NSAttributedString+JCCalculateSize.m
| |____UIColor+HightlightedColor.h
| |____UIColor+HightlightedColor.m
| |____UIImage+JCColor2Image.h
| |____UIImage+JCColor2Image.m
| |____UIViewController+JCPresentQueue.h // 队列管理model控制器
| |____UIViewController+JCPresentQueue.m
| |____UIWindow+JCBlur.h
| |____UIWindow+JCBlur.m
|____JCAlertView.h // 入口类
|____JCAlertView.m
|____Style // 样式
| |____JCAlertStyle.h // 在这个类中加入自定义样式的枚举和对应的方法
| |____JCAlertStyle.m
| |____JCAlertStyleAlertView.h
| |____JCAlertStyleAlertView.m
| |____JCAlertStyleBackground.h
| |____JCAlertStyleBackground.m
| |____JCAlertStyleButton.h
| |____JCAlertStyleButton.m
| |____JCAlertStyleButtonCancel.h
| |____JCAlertStyleButtonCancel.m
| |____JCAlertStyleButtonNormal.h
| |____JCAlertStyleButtonNormal.m
| |____JCAlertStyleButtonWarning.h
| |____JCAlertStyleButtonWarning.m
| |____JCAlertStyleContent.h
| |____JCAlertStyleContent.m
| |____JCAlertStyleSeparator.h
| |____JCAlertStyleSeparator.m
| |____JCAlertStyleTitle.h
| |____JCAlertStyleTitle.m
|____TransitionAnimation // 自定义控制器转场动画
| |____JCDimissAnimation.h
| |____JCDimissAnimation.m
| |____JCPresentAnimation.h
| |____JCPresentAnimation.m
```

## 导入库到项目中

第一步
```objc
platform :ios, '7.0'
target '你的target' do
pod 'JCAlertController'
end
```

第二步
```objc
#import "JCAlertView.h"
```

## 调用示范


简单调用
```objc
JCAlertView *alert = [JCAlertView alertWithTitle:@"我是title" message:@"我是content" type:JCAlertTypeNormal];
[alert addButton:@"好" type:JCButtonTypeNormal clicked:nil];
[alert showOnController:self];
```
加上事件和回调
```objc
JCAlertView *alert = [JCAlertView alertWithTitle:@"我是title" message:nil type:JCAlertTypeTitleOnly];
[alert addButton:@"好" type:JCButtonTypeNormal clicked:^{
    NSLog(@"按钮被点击");
}];
[alert showOnController:self presented:^{
    NSLog(@"alert presented");
} dismissed:^{
     NSLog(@"alert dismissed");
}];
```
自定义样式
```objc
JCAlertView *alert = [JCAlertView alertWithTitle:@"我是title" message:@"我是content" type:JCAlertTypeAwesome];
[alert addButton:@"好" type:JCButtonTypeNormal clicked:nil];
[alert showOnController:self];
```
队列弹出
```objc
JCAlertView *alert1 = [JCAlertView alertWithTitle:@"我是第一个" message:nil type:JCAlertTypeTitleOnly];
[alert1 addButton:@"好" type:JCButtonTypeNormal clicked:nil];
[alert1 showOnController:self];

JCAlertView *alert2 = [JCAlertView alertWithTitle:@"我是第二个" message:nil type:JCAlertTypeTitleOnly];
[alert2 addButton:@"好" type:JCButtonTypeNormal clicked:nil];
[alert2 showOnController:self];

JCAlertView *alert3 = [JCAlertView alertWithTitle:@"我是第三个" message:nil type:JCAlertTypeTitleOnly];
[alert3 addButton:@"好" type:JCButtonTypeNormal clicked:nil];
[alert3 showOnController:self];
```
自定义contentView+键盘处理
```objc
UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, 240, 26)];
textField.layer.borderWidth = 1;
textField.layer.borderColor = [UIColor grayColor].CGColor;
textField.center = CGPointMake(140, 30);
textField.secureTextEntry = YES;
textField.textAlignment = NSTextAlignmentCenter;

UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 60)];
[contentView addSubview:textField];

JCAlertView *alert = [JCAlertView alertWithTitle:@"请输入密码" contentView:contentView type:JCAlertTypeNormal];
[alert addButton:@"确定" type:JCButtonTypeNormal clicked:^{
    NSLog(@"您输入了：%@", textField.text);
    [textField resignFirstResponder];
}];
[alert showOnController:self];

// 监听键盘状态
[alert monitorKeyboardShowed:^(CGFloat alertHeight, CGFloat keyboardHeight) {
    // 改变alert位置
    [alert moveToCenterY:alertHeight / 2 + 120 animated:YES];
}];
[alert monitorKeyboardHided:^{
    [alert moveToCenterY:JCAlertOriginCenterY animated:YES];
}];     
```

## Contact

E-mail: hjaycee@163.com

Blog: http://www.jianshu.com/u/8bde69945e50
