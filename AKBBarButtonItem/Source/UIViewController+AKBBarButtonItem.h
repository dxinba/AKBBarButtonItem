
#import <UIKit/UIKit.h>

@protocol AKBBarButtonItemDelegate <NSObject>

///自定义返回按钮
- (UIBarButtonItem *)akb_backButton;

@end

@interface UIViewController (AKBBarButtonItem)<AKBBarButtonItemDelegate>

///添加标题按钮,可以传入字符串(NSString)或数组(NSArray)以添加多个
- (UIViewController *(^)(id))akb_title;

///添加图片按钮,可以传入图片名(NSString)或数组(NSArray)以添加多个
- (UIViewController *(^)(id))akb_image;

///添加图片+标题按钮,第一个参数是图片名(NSString),第二个是标题(NSString)
- (UIViewController *(^)(NSString *,NSString *))akb_imageAndTitle;

///添加自己创建的按钮
- (UIViewController *(^)(UIBarButtonItem *))akb_item;

///添加返回按钮
- (UIViewController *(^)())akb_addBackButton;

///添加在左边
- (void (^)())akb_onLeft;

///添加在右边
- (void (^)())akb_onRight;

///获取barItem的btn
- (UIButton *)akb_getBarButtonWithTag:(NSInteger)tag;

///移除item
- (void)akb_removeBarButtonWithTag:(NSInteger)tag;

///按钮点击回调(在controller中重写该方法即可)
- (void)akb_barButtonItemClick:(UIButton *)sender;

///返回按钮点击回调(在controller中重写该方法即可,不会触发👆的方法)
- (void)akb_backButtonItemClick;

@end
