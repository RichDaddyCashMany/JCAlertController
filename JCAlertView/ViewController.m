//
//  ViewController.m
//  JCAlertView
//
//  Created by HJaycee on 2017/4/6.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "ViewController.h"
#import "JCAlertView.h"

#define identifier @"identifier"

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) JCAlertView *alert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"JCAlertView";
    
    self.dataSource =
  @[
      @{@"默认样式":@[@"我是title",@"我是content",@"title和content都有",@"title文字超出范围",@"content文字超出范围"]},
      @{@"其它样式":@[@"title和content都有"]},
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
            JCAlertView *alert = [JCAlertView alertWithTitle:@"我是title" message:nil type:JCAlertTypeTitleOnly];
            [alert addButton:@"好" type:JCButtonTypeNormal clicked:^{
                NSLog(@"按钮被点击");
            }];
            [alert showOnController:self presented:^{
                NSLog(@"alert presented");
            } dismissed:^{
                NSLog(@"alert dismissed");
            }];
        } else if (indexPath.row == 1) {
            JCAlertView *alert = [JCAlertView alertWithTitle:nil message:@"我是content" type:JCAlertTypeContentOnly];
            [alert addButton:@"好" type:JCButtonTypeNormal clicked:nil];
            [alert showOnController:self];
        } else if (indexPath.row == 2) {
            JCAlertView *alert = [JCAlertView alertWithTitle:@"我是title" message:@"我是content" type:JCAlertTypeNormal];
            [alert addButton:@"好" type:JCButtonTypeNormal clicked:nil];
            [alert showOnController:self];
        } else if (indexPath.row == 3) {
            JCAlertView *alert = [JCAlertView alertWithTitle:@"我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title 我是title " message:nil type:JCAlertTypeTitleOnly];
            [alert addButton:@"好" type:JCButtonTypeNormal clicked:nil];
            [alert showOnController:self];
        } else if (indexPath.row == 4) {
            JCAlertView *alert = [JCAlertView alertWithTitle:@"我是title" message:@"我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content 我是content " type:JCAlertTypeNormal];
            [alert addButton:@"好" type:JCButtonTypeNormal clicked:nil];
            [alert showOnController:self];
        }
    }
    
    if (indexPath.section == 1) {
        JCAlertView *alert = [JCAlertView alertWithTitle:@"我是title" message:@"我是content" type:JCAlertTypeAwesome];
        [alert addButton:@"好" type:JCButtonTypeNormal clicked:nil];
        [alert showOnController:self];
    }
    
    if (indexPath.section == 2) {
        JCAlertView *alert1 = [JCAlertView alertWithTitle:@"我是第一个" message:nil type:JCAlertTypeTitleOnly];
        [alert1 addButton:@"好" type:JCButtonTypeNormal clicked:nil];
        [alert1 showOnController:self];
        
        JCAlertView *alert2 = [JCAlertView alertWithTitle:@"我是第二个" message:nil type:JCAlertTypeTitleOnly];
        [alert2 addButton:@"好" type:JCButtonTypeNormal clicked:nil];
        [alert2 showOnController:self];
        
        JCAlertView *alert3 = [JCAlertView alertWithTitle:@"我是第三个" message:nil type:JCAlertTypeTitleOnly];
        [alert3 addButton:@"好" type:JCButtonTypeNormal clicked:nil];
        [alert3 showOnController:self];
    }
    
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 386)];
            contentView.image = [UIImage imageNamed:@"tmall.jpg"];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
            [contentView addGestureRecognizer:tap];
            contentView.userInteractionEnabled = YES;
            
            JCAlertView *alert = [JCAlertView alertWithTitle:nil contentView:contentView type:JCAlertTypeNormal];
            [alert showOnController:self];
            
            self.alert = alert;
        } else if (indexPath.row == 1) {
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
            
            self.alert = alert;
        } else {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 280, 100)];
            label.textAlignment = NSTextAlignmentCenter;
            NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"我是富文本"];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 2)];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 3)];
            label.attributedText = AttributedStr;
            
            JCAlertView *alert = [JCAlertView alertWithTitle:nil contentView:label type:JCAlertTypeAwesome];
            [alert addButton:@"确定" type:JCButtonTypeWarning clicked:nil];
            [alert showOnController:self];
        }
    }
}

- (void)dismiss {
    [self.alert dismissIfAllowed];
}

@end
