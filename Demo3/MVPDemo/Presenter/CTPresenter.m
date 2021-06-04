//
//  CTPresenter.m
//  MVPDemo
//
//  Created by Helios on 2021/6/4.
//

#import "CTPresenter.h"
#import "CTModel.h"
#import "CTView.h"

@interface CTPresenter()<CTViewDelegate>

//p和v相互持有，互有对象，所以通过weak打破循环引用
@property (weak, nonatomic) UIViewController *controller;
@end

@implementation CTPresenter

- (instancetype)initWithController:(UIViewController *)controller
{
    if (self = [super init]) {
        self.controller = controller;
        
        //创建view
        CTView *view = [CTView new];
        view.frame = CGRectMake(100, 100, 100, 150);
        view.delegate = self;
        [controller.view addSubview:view];
        
        //model
        CTModel *model = [CTModel new];
        model.name = @"名字";
        model.image = @"QQ";
        
        //赋值
        [view setName:model.name andImage:model.image];
    }
    return self;
}

#pragma mark - CTViewDelegate

- (void)appViewDidClick:(CTView *)view{
    NSLog(@"点击点击点击");
}

@end
