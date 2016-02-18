//
//  ViewController.m
//  CYDialogBox
//
//  Created by vis on 16/1/11.
//  Copyright © 2016年 vis. All rights reserved.
//

#import "ViewController.h"
#import "CYDialogBox.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CYDialogBox *dialog1 = [[CYDialogBox alloc]initDialogWithFrame:CGRectMake(50, 30, 250, 100) andDialogMode:value1 andDirection:top];
    dialog1.text = @"哈哈哈哈哈哈";
    dialog1.image = [UIImage imageNamed:@"1.jpg"];
    dialog1.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.7 alpha:0.2];
    [self.view addSubview:dialog1];
    
    
    CYDialogBox *dialog2 = [[CYDialogBox alloc]initDialogWithFrame:CGRectMake(50, 150, 250, 100) andDialogMode:value2 andDirection:left];
    dialog2.text = @"哈哈哈哈哈哈";
    dialog2.image = [UIImage imageNamed:@"1.jpg"];
    dialog2.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.7 alpha:0.2];
    [self.view addSubview:dialog2];
    
    CYDialogBox *dialog3 = [[CYDialogBox alloc]initDialogWithFrame:CGRectMake(50, 280, 250, 100) andDialogMode:value3 andDirection:right];
    dialog3.text = @"哈哈哈哈哈哈";
    dialog3.image = [UIImage imageNamed:@"1.jpg"];
    dialog3.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.7 alpha:0.2];
    [self.view addSubview:dialog3];
    
    CYDialogBox *dialog4 = [[CYDialogBox alloc]initDialogWithFrame:CGRectMake(50, 400, 250, 100) andDialogMode:value4 andDirection:bottom];
    dialog4.text = @"哈哈哈哈哈哈";
    dialog4.image = [UIImage imageNamed:@"1.jpg"];
    dialog4.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.7 alpha:0.2];
    [self.view addSubview:dialog4];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
