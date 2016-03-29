//
//  ViewController.m
//  画画板
//
//  Created by cb on 16/1/26.
//  Copyright © 2016年 cuibing. All rights reserved.
//

#import "ViewController.h"
#import "customView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet customView *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)didPressedClear:(id)sender {
    [self.customView clear];
}
- (IBAction)didPressBack:(id)sender {
    [self.customView back];
}
- (IBAction)didPressedSave:(id)sender {
    
    UIGraphicsBeginImageContext(self.customView.frame.size);
    
    [self.customView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *str = @"保存成功";
    if (error) {
        str = @"保存不成功";
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:str delegate: self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}
@end
