//
//  JFImageViewController.h
//  JFImageDisplay
//
//  Created by 南京秀柏信息 on 14/12/15.
//  Copyright (c) 2014年 GodLv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFImageViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, strong) NSURL *imageURL;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
