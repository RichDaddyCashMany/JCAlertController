# JCAlertView

## The simplest Alert !

![(logo)](http://img0.ph.126.net/GlYrv3nyOoF-h390LxS5zQ==/6631241488537592295.gif)

## Introduce

* 1.The simplest UIAlertView replacement. You can use it just write one line of code.
* 2.Don't be afraid that the length of message is too long. There is a UITextView to show long message automatically.It supports line break.
* 3.Support queue to manager alertViews .
* 4.Nice blur background .
* 5.Block syntax.
* 6.Support iOS 6 and greater.
* 7.Please add Accelerate.framework before use.

## How to use ?

#### [1] You should add `Accelerate.framework` first.
#### [2] After that, please look at the following codes or download demo directly.

#### 1.Show JCAlertView with 1 button
```objc
[JCAlertView showOneButtonWithTitle:@"title" Message:@"message" ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"button" Click:^{
    NSLog(@"click0");
}];
```
#### 2.Show JCAlertView with 2 buttons
```objc
[JCAlertView showTwoButtonsWithTitle:@"title" Message:@"message" ButtonType:JCAlertViewButtonTypeCancel ButtonTitle:@"button0" Click:^{
    NSLog(@"click0");
} ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"button1" Click:^{
     NSLog(@"click1");
}];
```

#### 3.Show JCAlertView with more than 2 buttons
```objc
[JCAlertView showMultipleButtonsWithTitle:@"title" Message:@"message" Click:^(NSInteger index) {
    NSLog(@"click%zi", index);
} Buttons:@{@(JCAlertViewButtonTypeDefault):@"index = 0"},@{@(JCAlertViewButtonTypeCancel):@"index = 1"},@{@(JCAlertViewButtonTypeWarn):@"index = 2"}, nil];
```

## Contact me

#### E-mail : hjaycee@163.com
#### Blog : http://blog.csdn.net/hjaycee
#### If you have any question or suggestion please feel free to connect me. Thank you!
