//
//  ViewController.m
//  MVPDemo
//
//  Created by Helios on 2021/6/4.
//

#import "ViewController.h"
#import "CTPresenter.h"

@interface ViewController ()

@property (strong,nonatomic) CTPresenter *presenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化presenter
    self.presenter = [[CTPresenter alloc] initWithController:self];
}


@end
