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
    
    self.title = @"JCAlertController";
    
    self.dataSource = @[
                        @{@"Normal Style":@[@"only title",@"only content",@"title and content both",@"title words overflow",@"content words overflow"]},
                        @{@"Custom Style":@[@"change JCAlertTypeCustom"]},
                        @{@"Present Queue":@[@"JCAlertController LIFO",
                                             @"JCAlertController FIFO",
                                             @"UIAlertController LIFO",
                                             @"UIAlertController FIFO"]},
                        @{@"Custom ContentView":@[@"contentView",@"contentView and keyboard handle",@"contentView and attributed string"]}];
    
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
            JCAlertController *alert = [JCAlertController alertWithTitle:@"I am title" message:nil type:JCAlertTypeTitleOnly];
            [alert addButtonWithTitle:@"Cancel" type:JCButtonTypeCancel clicked:^{
                NSLog(@"Cancel button clicked");
            }];
            [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:^{
                NSLog(@"OK button clicked");
            }];
            [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 1) {
            JCAlertController *alert = [JCAlertController alertWithTitle:nil message:@"I am content" type:JCAlertTypeContentOnly];
            [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 2) {
            JCAlertController *alert = [JCAlertController alertWithTitle:@"I am title" message:@"I am content" type:JCAlertTypeNormal];
            [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 3) {
            JCAlertController *alert = [JCAlertController alertWithTitle:@"I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title I am title " message:nil type:JCAlertTypeTitleOnly];
            [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 4) {
            JCAlertController *alert = [JCAlertController alertWithTitle:@"I am title" message:@"I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content I am content " type:JCAlertTypeNormal];
            [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
        }
    }
    
    if (indexPath.section == 1) {
        // See all properties in JCAlertStyle
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
        
        JCAlertController *alert = [JCAlertController alertWithTitle:@"I am title" message:@"I am content" type:JCAlertTypeCustom];
        [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
        [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
    }
    
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            // LIFO: alert3 >> alert2 >> alert4 >> alert1
            
            // alert1
            JCAlertController *alert1 = [JCAlertController alertWithTitle:@"alert1" message:nil type:JCAlertTypeTitleOnly];
            [alert1 addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert1 presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];

            // alert2
            JCAlertController *alert2 = [JCAlertController alertWithTitle:@"alert2" message:nil type:JCAlertTypeTitleOnly];
            [alert2 addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:^{
                // alert4
                JCAlertController *alert = [JCAlertController alertWithTitle:@"alert4" message:nil type:JCAlertTypeTitleOnly];
                [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
                [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
            }];
            [self jc_presentViewController:alert2 presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
            
            // alert3
            JCAlertController *alert3 = [JCAlertController alertWithTitle:@"alert3" message:nil type:JCAlertTypeTitleOnly];
            [alert3 addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert3 presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 1) {
            // FIFO >> alert2 >> alert3 >> alert4
            
            // alert1
            JCAlertController *alert1 = [JCAlertController alertWithTitle:@"alert1" message:nil type:JCAlertTypeTitleOnly];
            [alert1 addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert1 presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
            
            // alert2
            JCAlertController *alert2 = [JCAlertController alertWithTitle:@"alert2" message:nil type:JCAlertTypeTitleOnly];
            [alert2 addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:^{
                // alert4
                JCAlertController *alert = [JCAlertController alertWithTitle:@"alert4" message:nil type:JCAlertTypeTitleOnly];
                [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
                [self jc_presentViewController:alert presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
            }];
            [self jc_presentViewController:alert2 presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
            
            // alert3
            JCAlertController *alert3 = [JCAlertController alertWithTitle:@"alert3" message:nil type:JCAlertTypeTitleOnly];
            [alert3 addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert3 presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
        } else if (indexPath.row == 2){
            // LIFO: alert3 >> alert2 >> alert4 >> alert1
            
            // alert1
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"alert1" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
            [alert1 addAction:alertAction1];
            [self jc_presentViewController:alert1 presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
            
            // alert2
            UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"alert2" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                // alert4
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert4" message:nil preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:alertAction];
                [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
            }];
            [alert2 addAction:alertAction2];
            [self jc_presentViewController:alert2 presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
            
            // alert3
            UIAlertController *alert3 = [UIAlertController alertControllerWithTitle:@"alert3" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
            [alert3 addAction:alertAction3];
            [self jc_presentViewController:alert3 presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
        } else {
            // FIFO: alert1 >> alert2 >> alert3 >> alert4
            
            // alert1
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"alert1" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
            [alert1 addAction:alertAction1];
            [self jc_presentViewController:alert1 presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
            
            // alert2
            UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"alert2" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                // alert4
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert4" message:nil preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:alertAction];
                [self jc_presentViewController:alert presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
            }];
            [alert2 addAction:alertAction2];
            [self jc_presentViewController:alert2 presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
            
            // alert3
            UIAlertController *alert3 = [UIAlertController alertControllerWithTitle:@"alert3" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
            [alert3 addAction:alertAction3];
            [self jc_presentViewController:alert3 presentType:JCPresentTypeFIFO presentCompletion:nil dismissCompletion:nil];
        }
    }
    
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            UIImageView *contentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 175)];
            contentView.image = [UIImage imageNamed:@"alert"];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
            [contentView addGestureRecognizer:tap];
            contentView.userInteractionEnabled = YES;
            
            JCAlertController *alert = [JCAlertController alertWithTitle:nil contentView:contentView type:JCAlertTypeNormal];
            [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
            
            self.alertController = alert;
        } else if (indexPath.row == 1) {
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, 240, 26)];
            textField.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
            textField.layer.cornerRadius = 3;
            textField.clipsToBounds = YES;
            textField.center = CGPointMake(140, 30);
            textField.secureTextEntry = YES;
            textField.textAlignment = NSTextAlignmentCenter;
            
            UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 60)];
            [contentView addSubview:textField];
            
            JCAlertController *alert = [JCAlertController alertWithTitle:@"Enter password please" contentView:contentView type:JCAlertTypeNormal];
            [alert addButtonWithTitle:@"Confirm" type:JCButtonTypeNormal clicked:^{
                NSLog(@"You inputed：%@", textField.text);
                [textField resignFirstResponder];
            }];
            [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:^{
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
        } else {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 280, 100)];
            label.textAlignment = NSTextAlignmentCenter;
            NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"Hello"];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 2)];
            [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 3)];
            label.attributedText = AttributedStr;
            
            JCAlertController *alert = [JCAlertController alertWithTitle:nil contentView:label type:JCAlertTypeNormal];
            [alert addButtonWithTitle:@"OK" type:JCButtonTypeNormal clicked:nil];
            [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
        }
    }
}

- (void)dismiss {
    [self.alertController dismissViewControllerAnimated:YES completion:nil];
}

@end
