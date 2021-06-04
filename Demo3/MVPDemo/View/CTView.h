//
//  CTView.h
//  MVPDemo
//
//  Created by Helios on 2021/6/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CTView;
@protocol CTViewDelegate <NSObject>

@optional
-(void)appViewDidClick:(CTView *)view;

@end

@interface CTView : UIView

- (void)setName:(NSString *)name andImage:(NSString *)image;
@property (weak, nonatomic) id<CTViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
