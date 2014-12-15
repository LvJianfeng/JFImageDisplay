//
//  JFImageViewController.m
//  JFImageDisplay
//
//  Created by 南京秀柏信息 on 14/12/15.
//  Copyright (c) 2014年 GodLv. All rights reserved.
//

#import "JFImageViewController.h"

@interface JFImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation JFImageViewController

- (UIImageView *)imageView
{
    if(!_imageView) _imageView = [[UIImageView alloc] init];
    return _imageView;
}

- (UIImage *)image
{
    return self.imageView.image;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
    [self.imageView sizeToFit];
    self.scrollView.contentSize = self.image?self.image.size:CGSizeZero;
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidesWhenStopped = YES;
}

- (void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    //这里会阻塞主队列  因为dataWithContentsOfURL涉及网络（以http开头的话）
    //self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
    [self downloadingInternetImage];
}


- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView addSubview:self.imageView];
    [self.activityIndicator startAnimating];
}

- (void)downloadingInternetImage
{
    self.image = nil;
    if (self.imageURL) {
        NSURLRequest *request = [NSURLRequest requestWithURL:self.imageURL];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            if (!error) {
                if ([request.URL isEqual:self.imageURL]) {
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                    dispatch_async(dispatch_get_main_queue(), ^{self.image = image;});
                    
                    //self performSelectorOnMainThread:<#(SEL)#> withObject:<#(id)#> waitUntilDone:<#(BOOL)#>  与上面的dispath基本一样的
                }
            }
        }];
        [task resume];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}
@end
