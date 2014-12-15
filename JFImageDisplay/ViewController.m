//
//  ViewController.m
//  JFImageDisplay
//
//  Created by LvJianfeng on 14/12/15.
//  Copyright (c) 2014年 GodLv. All rights reserved.
//

#import "ViewController.h"
#import "JFImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//http://r.photo.store.qq.com/psb?/V14Qk6Fn2feo2p/hiZr*zlJUjIXBis7AbMyUOA8*OYF4CZ.ZFENprn6OFQ!/r/dJ5e9KPAGAAA
//http://r.photo.store.qq.com/psb?/V14Qk6Fn2feo2p/xLno5ZPoHnINXOyL.JpQSnXvYAZ1emat4hMtjRSDpuY!/r/dNn5iaTgFQAA
//http://b122.photo.store.qq.com/psb?/V14Qk6Fn1dZP0i/c5M1kGwka*EV4gthjEwpZNBKAbr4pdPqCG8TZrUo0f4!/b/dM*IukicAAAA&bo=IANYAgAAAAABAF4!&rf=viewer_4&t=5

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[JFImageViewController class]])
    {
        JFImageViewController *ivc = (JFImageViewController *)segue.destinationViewController;
        if ([segue.identifier isEqualToString:@"Scenery"]) {
            ivc.imageURL = [NSURL URLWithString:@"http://r.photo.store.qq.com/psb?/V14Qk6Fn2feo2p/hiZr*zlJUjIXBis7AbMyUOA8*OYF4CZ.ZFENprn6OFQ!/r/dJ5e9KPAGAAA"];
        }else if([segue.identifier isEqualToString:@"Friend"]){
            ivc.imageURL = [NSURL URLWithString:@"http://r.photo.store.qq.com/psb?/V14Qk6Fn2feo2p/xLno5ZPoHnINXOyL.JpQSnXvYAZ1emat4hMtjRSDpuY!/r/dNn5iaTgFQAA"];
        }else{
            ivc.imageURL = [NSURL URLWithString:@"http://b122.photo.store.qq.com/psb?/V14Qk6Fn1dZP0i/c5M1kGwka*EV4gthjEwpZNBKAbr4pdPqCG8TZrUo0f4!/b/dM*IukicAAAA&bo=IANYAgAAAAABAF4!&rf=viewer_4&t=5"];
        }
        
        ivc.title = segue.identifier;
    }
}

@end
