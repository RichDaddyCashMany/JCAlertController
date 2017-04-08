<img src="https://lh3.googleusercontent.com/OoWK7hQYWoGnP8ZhdgzQJ8-0sXE5LimuVIehBhzAn1Y_BrfIPh_yKjYyozWHsb79QptDJhQbCkZPrWq3trk1EodNm_UtHksKGiF0-uAx4Y6YQh-DHMSUy5xDuHJNeDgNJpQcB7gb_kJw45bDBKEn6HUA8d1hux5B1safFPR9v0DTOKVXkOb94by85ooRJ8UIWt7kPXGTE4pd0iqRk5ooDXfajCDoxDbc_5i3Na9Vj9jcKjDidAKtuaNi_BZJUz9fDWqnFuoIHt-p_6mtA1CERPfO3DFzspCFtB7dsA0cznI7TOXMPsAlYFEuKTEuIZiWNETaG-nUscAJc_HWMplknB9_LIVXYfZJBkEvDJP_NWVY5ekJ8L3n6kE2EkEorFHb5YGnFRENNao57vVsk9b7M7lCQJ2NMnCaPM2MQHN734g_bRvwdb-acGmV7s7SjyZrdUmhgWcFhmIzRDMFOGAYW09h4WwxQYBr5vXh9FPrM_KVf8PXfWxSO3ziOH3Q1DkaP6Sr738Vn1CqmjF7u8tEOSBIe1SUtiQ8FfNhQ72K1RNN_a941rh_iBy_uVqp88cQ0fV2tQ0E84lvm3yb_Eaqio4putKMpmPVE08Wp_BFPGL00VqfZjo=w752-h100-no" width="650">

# 

JCAlertController继承于UIViewController，可以作为替代UIAlertController的弹窗库，使用简单，可自定义程度高。


| 比较  |队列管理   |   自定义样式 | 自定义view |  最低支持系统 |
| :----:   | :----:  | :----:  | :----: | :----:  |
| JCAlertController |  支持  |  简单 | 简单 | iOS 7|
| UIAlertController | 不支持 |  复杂 | 复杂 | iOS 8|



* 自动队列化管理，无需关心控制器栈
* 支持自定义样式
* 支持自定义contentView

## 效果预览

#### <a>默认样式</a>
<img src="https://lh3.googleusercontent.com/JCxTouZuiBdfp7ei8m0QLcVPX7WoD4caV9mwxruW635v3GosGiaNuimqoIvwB-uF1W6dYEkKM50p45I7fET17s6v99kZe92IxaEBy5SsT7mTDqFfHcIpLNTOQZSgEj1w0_64PYe_Ne5nBqkG9vHuOwpdno-U1SuJE44RlMXnx9q81kSc6X4gRcV4bOdXY3Y-PdDHdz5j66A7Ep2tBqqTvZ9sDuU2umz_G_ZpjyJpjjokpXERsN6GqPzzax7-SuGLTw6OR2ACRH0UAQFE49ZS9ryvfZkda-OD3J5yBSXNjA-MS3cNTW4ZjARJfzJ8DHkcYw8hhiN1KtaFu-WnuBNzaZzbp33mt89QI05CZvozvnCcdhCtxZm22L1ROGx3HuG-03FAqQeDdTu42rqi5AuGX1XWhXuZYrSZfkBKpv7rZAYgMW07paMzYTY9T5Tx-l7ah4CiTDxXGTBNr1oAz9UfoV0xjc2LeYEAnBBKUKhs8FOk-0eLTeWfPGdD0Nngsr-7g0lp2x-LDz9rRpWj2zYEYw5DKlYPfHGBf2DwRXHivE6kHvqrl5rqUVA51gaJ5pAXlNX_iOfDSi6w6Nd_PXcBPOJnvlYcISxleeQ105NRAFwgO-m6Rj0=w640-h227-no" width="320">

#### <a>默认样式（只有title）</a>
<img src="https://lh3.googleusercontent.com/JtBrMND4hI9ZEhmzbup2X-kACszUbd-DFsBAZ9PNayhatBYVAXnXK3sNQMcp-1lux1O6unVMTo6awJ-vZaKJ_TXAOjjp06AuZKD1ZwOn1kW2Q_5oY3mLmQGdBc5Ak3VqLU4tRrFShCgB_R-Ct3j7aqsDhoBkBNstsNgRREEs_DrC1KjJwZ5bIoPoXDgutoO00YtxJzUSgqezcHfW8A5KdqIWo0Bk8kTVnGoTzW2B197V-8NQmfBLlpQ41VBLGZgzGq8laxaqs5rYJ3DAz9-DlG59PKmb-ba3adFK05EAV4E0nHac0moCd2--brg12Xgd_jzn4qYj4KERCpsPWu3oQPsMDRYkWiC41Rmm0BrOiWVA_JHwCAGaBkIaiJtyGINUOBu8wdmLJUAXGLdIEioBUoaFIRVvqwcU_Vbb6Cvu78SJNYkAjmsAq63TyQSIdHgv7-4XuOdeQnWEelu4c8L1-B4-pKpNw1G9ea7aYMeus6Ay-JzgszsrYblOcQ7kBhL_qq3IzGp64e-vq2oduJtsy7eP5gQRy3uTWiqZ1xk4YBW3mOppdj31Q32NO3tVfUfdzm8ul95h_9Q830VEUNT8000TyGAeD4gN_OmwAFdm5X3dcl3UOaM=w640-h243-no" width="320">

#### <a>默认样式（只有content）</a>
<img src="https://lh3.googleusercontent.com/GYfr7dFQjZ7IX7XnlWOiuOXc9KCURkXIfCgE6K52IqrdesL01sJqSDpzYSsHW_HtIi5u7PtdKFAJlgTuKBQiWITb_YGTOSFpqiM9wysYzG6MQNIiAtcbVXaFQSHkvGx0WBYwAKPCS77VlVpMuopXEt-1HwhQJ7nrcM1oz_4cGS5_aACmv7d_MqP6KW6-ZUbhC5r6LeLEOGeNkh7fRSrHop7QNcsQLu0TzQ7ey59SnWMXVErOBQTxxAYDPZKY0-Ss29-OIkvSKekPy4R8jBoyKIEE1n8aoXIxFBgGSIDpS2HAplYyDKmmbdx7Q0GwZrIXc815vxIYAhQo1Ag2oel5Z2toviE3_UGgARCCf7yQ7Y-ua1DYHqsBDrbK5l9OtvpSDRzx0fIkpsf63HYytw-7oeZM1qcOVD6pO89Vwq83XvNXARlk0jeM4xuwRNgMltm4WSaoLq1u5e0DDirb8M9xyEZBjwrttmIe3CmdVB5ZhXO6V1aL8PBJv12No42QYnAEZl47xjihL-mPyPun-pSKF-NSCw97G-rwAE5ixE4SToaWIUHLWlcNcXAy6BAXPoKpZRKcg6oaraavqyTn1oD6-hERMTmOkgSkTATK7wqLkgCth220-0U=w640-h237-no" width="320">


#### <a>默认样式 超长文字</a>
<img src="https://lh3.googleusercontent.com/zkjGD2qRWXTejXzD11DF4hcQSzMMERMfdZAI5CLYKna2_dL0BCF7d7cX2r2w3DISXGuWmZEeHzbvmDT_gfH520OD5mBD84u3rpF01Yo0BgK9FS0vBV-VaZv5A9DdB76P3ELfBgzBKBvPkvlgJYPx6c2Vb3NmUzTu7jDIjt4kSxHeVzAsyH206ZzPgrTYnIDn1Cn8oPtB7AuSRWUg0HvQ7is0oHuopdAJ_zvk9KUYxOG7F5ElYlcK9nm5E1eOl5eVKVTCQQvdSXpRs2ppgSPlSNrXhpYhjfzMAGUgObzX9yxEA78g_n0J8UYe-FyGp6FQOd6VMZWdFmbk4QgwHvCDrO_RhRKxOnmY36hGkjSwPduiNnHeWxipl-EcGHxdUKO9rBS7-zwDcB9mr3qWESh2DBfhU23jZN6fbbdRtPdeIQxcvGSf4jAp18HcqLFZtlxVVzkENAeLJhHEUaU713_h1jNPnLRm6zN9igUDvZvAAvv5W4G1JOv5seuH2pcSTx_RdSXa3EJuOEWL2uzQ-s5OjghMOSgKxd4hCwU0bz6M5SuVx37VLWz090HfaYYxLyopJz4G5LCHSSwR-P927Cxcg-Irn1QTPe_66H7JfqIJm2EgQKh2JME=w640-h1136-no" width="320">

#### <a>自定义样式</a>
<img src="https://lh3.googleusercontent.com/VyBsXYAWBourMIieCmoeA6GHJZcgZ-kCfeyD8hE9OAZ77C9BhFk5yblCuKstqMCVCeachdMrqNxprnBsT0fd9tO5GcryldktauN_VDJRVbFfVAlVEAKAMAFIJsbInrwyD3AwNI4JJBul6Fr3wfMCMbPd5Ed-a-GAl0lJYEDfG5wqy-t7EhOIDDQVN_krYb19uUaECTuRfTmXBo4OP8DYzkI3cwm3fmCrS8zbAs5EPIuBFwyfS91TZvWTB_Ly4dTRCb_T_KQNc7QJ-eBbIaCNJtXwp84KFcunGd7kgH6u0UWwgjVl5ri4sW5MRIyPNJgcKY4MZRqyTbpnO_qUB5sJ0SYWkvV3JGL5FW92QCoLVSoIIGyMlHsEptsQVZZToNNT15OdlBD5dZSIll0c_i1VQDVcPmsgZo1Jaz5K1vmgpCY9tGS6WGvNvcCwcXl9Zbu_Eq8CIuKzxrjRaNQ7bgXx7KmlskVXwMUPymQNkzDOWbNr5_sVBFRF7I94MqR-LB0s66ZnjksfkP33anGK98VdD40G5_niJRoWWy5x15qmFo3YrxXMWwgA6juxIL0SglMGE6JE-nWDe7oelIgkJNG3h8Kmu8hYcqP_LQ5RPzU6K0wEWU6o_tE=w640-h332-no" width="320">

#### <a>自定义contentView</a>
<img src="https://lh3.googleusercontent.com/G-5--2SMNs0aS9xpNA8T2WQXhCUd6BKQfo0STBWdZ6uujvz_yYKjLJfjtpxPd948AIcttreMfFHR4EDwAy6iqgz2woGAJxbav57a64TaE_be3zyI9S6OUmr8aCYRInunDEjAQwUxcoHhj-g5F02TNHRihqKhJ6hnKu0HKLg2eX17bUsGDEwmg7CoeACWgowv7BeaB1gjgdDO_ycD6YJqHGPBqOWLUcJtU7RRv6ed24l8u9hlZiA5-bPB02aOuaiTnGvHiUYwsicyvqHkvDb07chA3oFCSOIr20I2uW03LFVqO8w_8EbM9JfjvaXS98UPlPQKkCvy6LFWddC2rHw6uZhkax6ZePLjvaXsLnL829I4UOX4ndPOUxZNQJmk2SGKBjR_t5jLSaQlUI-jKOeGvRMGNLt-O1TP1WwV3bSK4xoCuddO21xwC_ZKmr3_BXeLLcQCK6l4sPADsOcn7cPzA8fI0x9GUJnwa0ELkiLJ--sp8jqnsJBAbHU95jr_o05-Dn-Fb0IwFFCRFzHfnd-tdFwvIVjwhDjWPbeiC81_pJ1AR5VUsnfxUZSicKUwjUx7c0zLRyDNMZUWFC8ZZG3BSfjERq2jd6PsJ0NG9z20JbeYxivfz2E=w640-h421-no" width="320">

#### <a>自定义contentView+键盘处理</a>
<img src="https://lh3.googleusercontent.com/IWahsBNpd7gZHK3OKcHOhItjiSbvuBovE9VC-sRZV3Rg2Y8tfH7_XfmQOKI0UQgz0uR7z4Eebg-3LBbpQnIor4E0h9D6jao70D5W3iCWKCmJzBkbf228awBG96oUAuqOOsnxoMrc6iHT6vxU_mg81aInQzXaMyVj61qC8MnQGcNfWRL6B2GbwPkrTZOEkz-fTGaCqWyRoDQbrBIjADxitwEdX7mU_4vv_ij1Y_0W7FYEpxDcaH6Mx07b9YYOep5hsEljxswjq961zDLikcn8MXlMIrO2sr21kF0EBdUl0iQV8Ua9Up1lO8OKrNgDi4SDcJZ58uoF_1qy_mP915TPaElymqK21yKMpNNfxwGWKaSGRohRI3kvjmENnSZQuSTU-b--FphCVt4Bzi4yfUWqSztUDx3PJwqpA4UMZ2xlAKnGmkEV-2bXjECC4FwapmiuTeuZJirZkytM_-5ni8sLFEOxa2lyziH22bA5MRsPLDo_FvKvmDOiS-_wsyK2rPWmyY8FIgjQ84T9hJQmpQG_L-wJBAUuMqhs6fvf1M4au4y4Lfm3EnsOF2xHXmaMMJS3I_B1H2BctRWCJhz1SVhiW8rqTyete28fTV23d0p8u8PBdID1IMU=w640-h1136-no" width="320">

#### <a>自定义contentView+富文本</a>
<img src="https://lh3.googleusercontent.com/3aWdAoJAwKMhNkPGx0Y6lJmlvuqmfTaYaTbSzeICwnYTtlMBNIWCvBbMZdLdqDXKNFwdiSToDBswcKWLfje1rRvAbtAiWaaKEwVKqN5VZLbm85nmzNWrkJr_q3Kko_Xnw-f9ioGGTn7UdyqC9ykXxPE9loWS6QXOl14ZeHhjzGIHKYsqOkg2Itlf6H8GjaSa8GUI1mzemJD2uxMOnzEFZThFZ4n94Og8QF7zpq21-_N5eskl-yntGzMzpnp1B5EJO_NNX9PD4y01aLNMO_Thog1rae7AsYbL_b0u-A7j9lDkz6iohEW70ycmmq9taMWi9UgnK4Fe1ZkdWGMyowrtPotveuy9WwjDfU_kuTBBBgBcj8q1C9LFWKRrg1wnxtyeBvcAge2ZsRGEDpwT4oMQePsTOj-5aqbVIO7c_AwZa-F9CDrYLJrhafa9RC1TguW-3RANvuO_E8rP6SNEmG0f4QJZzVhInEprBRwIHh3JevikXR-LxvhMUyZ92xmzSxoI8A5TDaPWCtd5WsDladqQE1iqHFAgZLwnoi9fSrrMFmtG4U5czWet6QJj-WZuvRKOY9hj3dr2xvV3kVm_tSgPFR8JtSpZjwd-XrREqJi_NVnc8R3vwhM=w640-h317-no" width="320">


## 文件结构

```objc
.
|____.DS_Store
|____AlertView
| |____JCAlertView.h // 控制器上的弹出层
| |____JCAlertView.m
|____ButtonItem
| |____JCAlertButtonItem.h // 按钮模型
| |____JCAlertButtonItem.m
|____Category
| |____NSAttributedString+JCCalculateSize.h // 文本尺寸计算分类
| |____NSAttributedString+JCCalculateSize.m
| |____UIColor+JCHightlightedColor.h // 高亮颜色分类
| |____UIColor+JCHightlightedColor.m
| |____UIImage+JCColor2Image.h // 颜色转图片分类
| |____UIImage+JCColor2Image.m
| |____UIViewController+JCPresentQueue.h // 队列管理分类
| |____UIViewController+JCPresentQueue.m
| |____UIWindow+JCBlur.h // 模糊截图分类
| |____UIWindow+JCBlur.m
|____JCAlertController.h // 入口类
|____JCAlertController.m
|____Style
| |____JCAlertStyle.h // 样式类
| |____JCAlertStyle.m
| |____JCAlertStyleAlertView.h // 弹出层样式
| |____JCAlertStyleAlertView.m
| |____JCAlertStyleBackground.h // 背景样式
| |____JCAlertStyleBackground.m
| |____JCAlertStyleButton.h // 按钮样式
| |____JCAlertStyleButton.m
| |____JCAlertStyleButtonCancel.h // 取消按钮样式
| |____JCAlertStyleButtonCancel.m
| |____JCAlertStyleButtonNormal.h // 默认按钮样式
| |____JCAlertStyleButtonNormal.m
| |____JCAlertStyleButtonWarning.h // 警告按钮样式
| |____JCAlertStyleButtonWarning.m
| |____JCAlertStyleContent.h // 内容样式
| |____JCAlertStyleContent.m
| |____JCAlertStyleSeparator.h // 按钮分隔线样式
| |____JCAlertStyleSeparator.m
| |____JCAlertStyleTitle.h // 标题样式
| |____JCAlertStyleTitle.m
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
#import "JCAlertController.h"
```

## 调用示范


只有title
```objc
JCAlertController *alert = [[JCAlertController alloc] initWithTitle:@"我是title" message:nil type:JCAlertTypeTitleOnly];
[alert addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
[self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
```
只有content
```objc
JCAlertController *alert = [[JCAlertController alloc] initWithTitle:nil message:@"我是content" type:JCAlertTypeContentOnly];
[alert addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
[self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
```
title和content都有
```objc
JCAlertController *alert = [[JCAlertController alloc] initWithTitle:@"我是title" message:@"我是content" type:JCAlertTypeNormal];
[alert addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
[self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
```
自定义样式（JCAlertStyle）
```objc
// 这里只对部分属性修改，其它属性请到'JCAlertStyle'相关类中查看
// 仅拿'JCAlertTypeCustom'作为示范，其它枚举类型的style对象也可以对其属性进行修改
JCAlertStyle *style = [JCAlertStyle styleWithType:JCAlertTypeCustom];
style.background.blur = NO;
style.alertView.cornerRadius = 4;
style.title.backgroundColor = [UIColor colorWithRed:251/255.0 green:2/255.0 blue:19/255.0 alpha:1.0];
style.title.textColor = [UIColor whiteColor];
style.content.backgroundColor = [UIColor colorWithRed:251/255.0 green:2/255.0 blue:19/255.0 alpha:1.0];
style.content.textColor = [UIColor whiteColor];
style.content.insets = UIEdgeInsetsMake(20, 20, 40, 20);
style.buttonNormal.textColor = [UIColor colorWithRed:248/255.0 green:59/255.0 blue:50/255.0 alpha:1.0];
style.buttonNormal.highlightTextColor = [style.buttonNormal.textColor hightlightedColor];
style.buttonNormal.backgroundColor = [UIColor whiteColor];
style.buttonNormal.highlightBackgroundColor = [UIColor whiteColor];

JCAlertController *alert = [[JCAlertController alloc] initWithTitle:@"我是title" message:@"我是content" type:JCAlertTypeCustom];
[alert addButtonWithTitle:@"确定" type:JCButtonTypeNormal clicked:nil];
[self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
```
队列弹出
```objc
JCAlertController *alert1 = [[JCAlertController alloc] initWithTitle:@"我是第一个" message:nil type:JCAlertTypeTitleOnly];
[alert1 addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
[self jc_presentViewController:alert1 presentCompletion:nil dismissCompletion:nil];

JCAlertController *alert2 = [[JCAlertController alloc] initWithTitle:@"我是第二个" message:nil type:JCAlertTypeTitleOnly];
[alert2 addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
[self jc_presentViewController:alert2 presentCompletion:nil dismissCompletion:nil];

JCAlertController *alert3 = [[JCAlertController alloc] initWithTitle:@"我是第三个" message:nil type:JCAlertTypeTitleOnly];
[alert3 addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
[self jc_presentViewController:alert3 presentCompletion:nil dismissCompletion:nil];
```
全自定义contentView
```objc
UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 175)];
contentView.image = [UIImage imageNamed:@"picName"];
UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
[contentView addGestureRecognizer:tap];
contentView.userInteractionEnabled = YES;

JCAlertController *alert = [[JCAlertController alloc] initWithTitle:nil contentView:contentView type:JCAlertTypeNormal];
[self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];

self.alertController = alert;
```
半自定义contentView+键盘处理
```objc
UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, 240, 26)];
textField.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
textField.layer.cornerRadius = 3;
textField.clipsToBounds = YES;
textField.center = CGPointMake(140, 30);
textField.secureTextEntry = YES;
textField.textAlignment = NSTextAlignmentCenter;

UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 60)];
[contentView addSubview:textField];

JCAlertController *alert = [[JCAlertController alloc] initWithTitle:@"请输入密码" contentView:contentView type:JCAlertTypeNormal];
[alert addButtonWithTitle:@"确定" type:JCButtonTypeNormal clicked:^{
NSLog(@"您输入了：%@", textField.text);
[textField resignFirstResponder];
}];
[self jc_presentViewController:alert presentCompletion:^{
[textField becomeFirstResponder];
} dismissCompletion:nil];

// 防止循环引用
__weak typeof(JCAlertController *) weakalert = alert;

// 监听键盘状态
[alert monitorKeyboardShowed:^(CGFloat alertHeight, CGFloat keyboardHeight) {
// 改变alert位置
[weakalert moveAlertViewToCenterY:alertHeight / 2 + 120 animated:YES];
}];
[alert monitorKeyboardHided:^{
[weakalert moveAlertViewToScreenCenterAnimated:YES];
}];   
```
半自定义contentView+富文本
```objc
UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 280, 100)];
label.textAlignment = NSTextAlignmentCenter;
NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"我是富文本"];
[AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 2)];
[AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 3)];
label.attributedText = AttributedStr;

JCAlertController *alert = [[JCAlertController alloc] initWithTitle:nil contentView:label type:JCAlertTypeNormal];
[alert addButtonWithTitle:@"确定" type:JCButtonTypeNormal clicked:nil];
[self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
```

## Contact

E-mail: hjaycee@163.com

Blog: http://www.jianshu.com/u/8bde69945e50
