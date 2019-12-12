//
//  ViewController.m
//  QRCodeGenerator
//
//  Created by Marco André Marinho Lopes on 03/05/2019.
//  Copyright © 2019 Marco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *qrString = @"7777";
    NSData *stringData = [qrString dataUsingEncoding: NSUTF8StringEncoding];
    
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    CIImage *qrImage = qrFilter.outputImage;
    float scaleX = self.qrImageView.frame.size.width / qrImage.extent.size.width;
    float scaleY = self.qrImageView.frame.size.height / qrImage.extent.size.height;
    
    qrImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(scaleX, scaleY)];
    
    self.qrImageView.image = [UIImage imageWithCIImage:qrImage
                                                 scale:[UIScreen mainScreen].scale
                                           orientation:UIImageOrientationUp];
    
}


@end
