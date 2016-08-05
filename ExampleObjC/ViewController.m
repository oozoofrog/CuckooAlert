//
//  ViewController.m
//  ExampleObjC
//
//  Created by jayios on 2016. 8. 5..
//  Copyright © 2016년 gretech. All rights reserved.
//

#import "ViewController.h"
@import CuckooAlert;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:cancel];
    [alert showWithParentViewController:self animated:true completion:nil];
    alert = [UIAlertController alertControllerWithTitle:@"title2" message:@"message2" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:cancel];
    [alert showWithParentViewController:self animated:true completion:nil];
    
    // This will be ignored with some Warning:
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"2"] animated:YES completion:nil];
    
    alert = [UIAlertController alertControllerWithTitle:@"title3" message:@"message3" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:cancel];
    [alert showWithParentViewController:self animated:true completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
