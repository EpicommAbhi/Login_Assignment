//
//  ViewController.m
//  Login_Assignment
//
//  Created by Abhijeetk on 7/30/18.
//  Copyright © 2018 Abhijeetk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblForgotPassword;
@end
UIAlertController *alertController;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:245/255.0 green:244/255.0 blue:244/255.0 alpha:1]];
    [self.btnLogin setBackgroundColor:[UIColor colorWithRed:219/255.0 green:41/255.0 blue:33/255.0 alpha:1]];
    self.lblForgotPassword.textColor = [UIColor colorWithRed:219/255.0 green:41/255.0 blue:33/255.0 alpha:1];
    
    [self.btnLogin addTarget:self
                      action:@selector(myAction)
            forControlEvents:UIControlEventTouchUpInside];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


-(void)myAction
{
    if (_txtEmail.text.length==0) {

        alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Login", "") message:NSLocalizedString(@"Email id Alert", "") preferredStyle:UIAlertControllerStyleAlert];
   
    }else if (_txtPassword.text.length==0)
    {
      
     alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Login", "") message:NSLocalizedString(@"Password  Alert", "") preferredStyle:UIAlertControllerStyleAlert];

    }
    else
    {
   alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Login", "") message:NSLocalizedString(@"Successfull Alert", "") preferredStyle:UIAlertControllerStyleAlert];
 
    }
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", "") style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
