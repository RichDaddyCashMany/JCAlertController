//
//  ViewController.m
//  JCAlertController
//
//  Created by HJaycee on 2017/4/6.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "ViewController.h"
#import "JCAlertController.h"

#define identifier @"identifier"

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, weak) JCAlertController *alertController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"JCAlertView";
    
    self.dataSource =
    @[
      @{@"默认样式":@[@"我是title",@"我是content",@"title和content都有",@"title文字超出范围",@"content文字超出范围"]},
      @{@"自定义样式":@[@"修改JCAlertTypeCustom样式"]},
      @{@"队列效果":@[@"队列效果演示"]},
      @{@"自定义contentView":@[@"全自定义contentView",@"半自定义contentView+键盘处理",@"半自定义contentView+富文本"]}
      ];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    [self.tableView reloadData];
}

#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = self.dataSource[section];
    NSArray *array = [dict.allValues firstObject];
    return array.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dict = self.dataSource[section];
    return dict.allKeys.firstObject;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    NSDictionary *dict = self.dataSource[indexPath.section];
    NSArray *array = [dict.allValues firstObject];
    cell.textLabel.text = array[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            JCAlertController *alert = [[JCAlertController alloc] initWithTitle:@"我是title" message:nil type:JCAlertTypeTitleOnly];
            [alert addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:^{
                NSLog(@"按钮被点击");
            }];
            [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 1) {
            JCAlertController *alert = [[JCAlertController alloc] initWithTitle:nil message:@"我是content" type:JCAlertTypeContentOnly];
            [alert addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 2) {
            JCAlertController *alert = [[JCAlertController alloc] initWithTitle:@"我是title" message:@"我是content" type:JCAlertTypeNormal];
            [alert addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 3) {
            JCAlertController *alert = [[JCAlertController alloc] initWithTitle:@"我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title " message:nil type:JCAlertTypeTitleOnly];
            [alert addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 4) {
            JCAlertController *alert = [[JCAlertController alloc] initWithTitle:@"我是title" message:@"我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content " type:JCAlertTypeNormal];
            [alert addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
        }
    }
    
    if (indexPath.section == 1) {
        // 这里只对部分属性修改，其它属性请到'JCAlertStyle'相关类中查看
        // 仅拿'JCAlertTypeCustom'作为示范，其它枚举类型的style对象也可以对其属性进行修改
        JCAlertStyle *style = [JCAlertStyle styleWithType:JCAlertTypeCustom];
        style.background.blur = NO;
        style.alertView.cornerRadius = 0;
        style.title.textColor = [UIColor colorWithRed:0 green:187/255.0 blue:81/255.0 alpha:1.0];
        style.title.font = [UIFont boldSystemFontOfSize:18];
        style.content.insets = UIEdgeInsetsMake(30, 20, 40, 20);
        style.content.textColor = [UIColor blackColor];
        style.content.font = [UIFont systemFontOfSize:16];
        style.buttonNormal.height = 50;
        style.buttonNormal.backgroundColor = [UIColor colorWithRed:0 green:187/255.0 blue:81/255.0 alpha:1.0];
        style.buttonNormal.highlightBackgroundColor = [style.buttonNormal.backgroundColor hightlightedColor];
        style.buttonCancel.backgroundColor = [UIColor lightGrayColor];
        
        JCAlertController *alert = [[JCAlertController alloc] initWithTitle:@"我是title" message:@"我是content" type:JCAlertTypeCustom];
        [alert addButtonWithTitle:@"取消" type:JCButtonTypeCancel clicked:nil];
        [alert addButtonWithTitle:@"确定" type:JCButtonTypeNormal clicked:nil];
        [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
    }
    
    if (indexPath.section == 2) {
        JCAlertController *alert1 = [[JCAlertController alloc] initWithTitle:@"我是第一个" message:nil type:JCAlertTypeTitleOnly];
        [alert1 addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
        [self jc_presentViewController:alert1 presentCompletion:nil dismissCompletion:nil];
        
        JCAlertController *alert2 = [[JCAlertController alloc] initWithTitle:@"我是第二个" message:nil type:JCAlertTypeTitleOnly];
        [alert2 addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
        [self jc_presentViewController:alert2 presentCompletion:nil dismissCompletion:nil];
        
        JCAlertController *alert3 = [[JCAlertController alloc] initWithTitle:@"我是第三个" message:nil type:JCAlertTypeTitleOnly];
        [alert3 addButtonWithTitle:@"好" type:JCButtonTypeNormal clicked:nil];
        [self jc_presentViewController:alert3 presentCompletion:nil dismissCompletion:nil];
    }
    
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 175)];
            contentView.image = [UIImage imageNamed:@"alert"];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
            [contentView addGestureRecognizer:tap];
            contentView.userInteractionEnabled = YES;
            
            JCAlertController *alert = [[JCAlertController alloc] initWithTitle:nil contentView:contentView type:JCAlertTypeNormal];
            [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
            
            self.alertController = alert;
        } else if (indexPath.row == 1) {
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, 240, 26)];
            textField.layer.borderWidth = 1;
            textField.layer.borderColor = [UIColor grayColor].CGColor;
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
        } else {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 280, 100)];
            label.textAlignment = NSTextAlignmentCenter;
            NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"我是富文本"];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 2)];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 3)];
            label.attributedText = AttributedStr;
            
            JCAlertController *alert = [[JCAlertController alloc] initWithTitle:nil contentView:label type:JCAlertTypeCustom];
            [alert addButtonWithTitle:@"确定" type:JCButtonTypeWarning clicked:nil];
            [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
        }
    }
}

- (void)dismiss {
    [self.alertController dismissViewControllerAnimated:YES completion:nil];
}

@end
