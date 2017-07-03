//
//  ViewController.m
//  JCAlertController
//
//  Created by HJaycee on 2017/4/6.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "ViewController.h"
#import "JCAlertController.h"
#import "NSObject+BlockSEL.h" // just used in demo

#define identifier @"identifier"
#define longTitle @"I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title "
#define longMessage @"I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content "

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"JCAlertController";
    
    self.dataSource = @[
                        @{@"Normal Style":@[@"only title",@"only content",@"title and content both",@"title words overflow",@"content words overflow"]},
                        @{@"Custom Style":@[@"change JCAlertTypeCustom"]},
                        @{@"Present Queue":@[@"JCAlertController LIFO",
                                             @"JCAlertController FIFO",
                                             @"UIAlertController LIFO",
                                             @"UIAlertController FIFO",
                                             @"UIAlertController default"]},
                        @{@"Custom ContentView":@[@"contentView",@"contentView and keyboard handle",@"contentView and attributed string"]}];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    [self.tableView reloadData];
}

#pragma mark - TableView delegate/datasource

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
            [self onlyTitle];
        } else if (indexPath.row == 1) {
            [self onlyContent];
        } else if (indexPath.row == 2) {
            [self titleAndContentBoth];
        } else if (indexPath.row == 3) {
            [self titleWordsOverflow];
        } else if (indexPath.row == 4) {
            [self contentWordsOverflow];
        }
    }
    
    if (indexPath.section == 1) {
        [self customStyle];
    }
    
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            [self JCAlertControllerLIFO];
        } else if (indexPath.row == 1) {
            [self JCAlertControllerFIFO];
        } else if (indexPath.row == 2){
            [self UIAlertControllerLIFO];
        } else if (indexPath.row == 3) {
            [self UIAlertControllerFIFO];
        } else {
            [self UIAlertControllerDefault];
        }
    }
    
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            [self customView];
        } else if (indexPath.row == 1) {
            [self customViewAndHandleKeyboard];
        } else {
            [self customViewAndAttributedString];
        }
    }
}

#pragma mark - Methods

- (void)onlyTitle {
    JCAlertController *alert = [JCAlertController alertWithTitle:@"I am title" message:nil];
    [alert addButtonWithTitle:@"Cancel" type:JCButtonTypeCancel clicked:^{
        NSLog(@"Cancel button clicked");
    }];
    [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:^{
        NSLog(@"OK button clicked");
    }];
    [self jc_presentViewController:alert presentCompletion:^{
        NSLog(@"present completion");
    } dismissCompletion:^{
        NSLog(@"dismiss completion");
    }];
}

- (void)onlyContent {
    JCAlertController *alert = [JCAlertController alertWithTitle:nil message:@"I am content"];
    [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
    [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
}

- (void)titleAndContentBoth {
    JCAlertController *alert = [JCAlertController alertWithTitle:@"JCAlertController" message:@"Support custom Style.\nSupport custom View.\nSupport presented with LIFO."];
    [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
    [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
}

- (void)titleWordsOverflow {
    JCAlertController *alert = [JCAlertController alertWithTitle:longTitle message:nil];
    [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
    [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
}

- (void)contentWordsOverflow {
    JCAlertController *alert = [JCAlertController alertWithTitle:@"I am title" message:longMessage];
    [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
    [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
}

- (void)customStyle {
    // See all properties in JCAlertStyle
    JCAlertStyle *style = [JCAlertStyle shareStyle];
    
    style.background.blur = YES;
    style.background.alpha = 0.65;
    style.background.canDismiss = YES;
    
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
    
    JCAlertController *alert = [JCAlertController alertWithTitle:@"I am title" message:@"I am content"];
    [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
    [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
}

- (void)JCAlertControllerLIFO {
    // LIFO: alert3 >> alert2 >> alert1
    for (int i = 1; i<4; i++) {
        JCAlertController *alert = [JCAlertController alertWithTitle:[NSString stringWithFormat:@"alert%zi", i] message:nil];
        [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
        [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
    }
}

- (void)JCAlertControllerFIFO {
    // FIFO alert1 >> alert2 >> alert3
    for (int i = 1; i<4; i++) {
        JCAlertController *alert = [JCAlertController alertWithTitle:[NSString stringWithFormat:@"alert%zi", i] message:nil];
        [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
        [self jc_presentViewController:alert presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
    }
}

- (void)UIAlertControllerLIFO {
    // LIFO: alert3 >> alert2 >> alert1
    for (int i = 1; i<4; i++) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"alert%zi", i] message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
    }
}

- (void)UIAlertControllerFIFO {
    // FIFO: alert1 >> alert2 >> alert3
    for (int i = 1; i<4; i++) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"alert%zi", i] message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        [self jc_presentViewController:alert presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
    }
}

- (void)UIAlertControllerDefault {
    // Only show one alert and log error msg.
    for (int i = 1; i<4; i++) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"alert%zi", i] message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)customView {
    // without title and button
    
    // setup a contentView
    CGFloat width = [JCAlertStyle shareStyle].alertView.width;
    UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, width * 0.623)];
    contentView.image = [UIImage imageNamed:@"alert"];
    contentView.userInteractionEnabled = YES;
    
    // pass the contentView
    JCAlertController *alert = [JCAlertController alertWithTitle:nil contentView:contentView];
    [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
    
    // avoid retain circle
    __weak JCAlertController *weakAlert = alert;
    
    // add gesture to dismiss alert
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:[self selectorBlock:^(id weakSelf, id arg) {
        [weakAlert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [contentView addGestureRecognizer:tap];
}

- (void)customViewAndHandleKeyboard {
    // without title
    
    CGFloat width = [JCAlertStyle shareStyle].alertView.width;
    
    // setup contentView with a textField inside
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width - 20, 26)];
    textField.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
    textField.layer.cornerRadius = 2;
    textField.clipsToBounds = YES;
    textField.center = CGPointMake(width / 2, 30);
    textField.secureTextEntry = YES;
    textField.textAlignment = NSTextAlignmentCenter;
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 60)];
    contentView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:textField];
    
    // pass the contentView
    JCAlertController *alert = [JCAlertController alertWithTitle:@"Enter password please" contentView:contentView];
    [alert addButtonWithTitle:@"Confirm" type:JCButtonTypeNormal clicked:^{
        NSLog(@"You inputed：%@", textField.text);
        [textField resignFirstResponder];
    }];
    [self jc_presentViewController:alert presentCompletion:^{
        [textField becomeFirstResponder];
    } dismissCompletion:nil];
    
    // avoid retain circle
    __weak typeof(JCAlertController *) weakalert = alert;
    
    // callback after keyboard shows
    [alert monitorKeyboardShowed:^(CGFloat alertHeight, CGFloat keyboardHeight) {
        [weakalert moveAlertViewToCenterY:alertHeight / 2 + 120 animated:YES];
    }];
    // callback after keyboard hides
    [alert monitorKeyboardHided:^{
        [weakalert moveAlertViewToScreenCenterAnimated:YES];
    }];
}

- (void)customViewAndAttributedString {
    // without title
    CGFloat width = [JCAlertStyle shareStyle].alertView.width;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 100)];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"Hello"];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 2)];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 3)];
    label.attributedText = AttributedStr;
    
    JCAlertController *alert = [JCAlertController alertWithTitle:nil contentView:label];
    [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
    [self jc_presentViewController:alert presentCompletion:nil dismissCompletion:nil];
}

@end
