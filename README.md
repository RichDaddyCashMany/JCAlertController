# JCAlertView

## The simplest alert !

### Default AlertView

![(logo)](http://img1.ph.126.net/hN1Ly3hgo0LT40vkoTThKg==/48976645965723676.jpg)

### Custom AlertView

![(logo)](http://img0.ph.126.net/jU26nZ3x_6L6cdTq3eeNOg==/6630823674119991789.jpg)

### GIF

![(logo)](http://img2.ph.126.net/2vE7asm56mgVAMrRGCzGfg==/6630431148468152504.gif)

# Introduce

* 1.The simplest UIAlertView replacement. You can use it just write one line of code.
* 2.Don't be afraid that the length of message is too long. There is a UITextView to show long message automatically.It supports line break.
* 3.Support queue to manager alertViews .
* 4.Nice blur background .
* 5.Block syntax.
* 6.Support iOS 6 and greater.
* 7.Please add Accelerate.framework before use.

# How to use ?

## 1 Cocoapods

##### Add a pod entry for JCAlertView to your Podfile `pod 'JCAlertView'`

## 2 Manual

##### copy the `JCAlertView` folder to your project

##### add `Accelerate.framework` to your project


# After that, please look at the following codes or download demo directly.

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

#### 4. Show JCAlertView with customView
```objc
UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
JCAlertView *customAlert = [[JCAlertView alloc] initWithCustomView:customView dismissWhenTouchedBackground:YES];
[customAlert show];
```

# Contact me

#### E-mail : hjaycee@163.com
#### Blog : http://blog.csdn.net/hjaycee
#### If you have any question or suggestion please feel free to connect me. Thank you!
