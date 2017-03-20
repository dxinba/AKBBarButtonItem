//     ▁▁       ▁▁  ▁▁   ▁▁
//    /  \      ▏▕ / /   ▏
//   / /\ \     ▏  \/    ▏
//  / /▁▁\ \    ▏ \ \    ▏
// / /▔▔▔▔\ \   ▏▕ \ \   ▏
/// /      \ \  ▏▕  \ \  ▏
//▔▔        ▔▔  ▔▔   ▔▔  ▔▔  TODO:B怎么弄?

#import <UIKit/UIKit.h>

@class AKBButton;

typedef void(^barItemBlock)(AKBButton *btn);

/**
 * Default is Right
 */
typedef NS_ENUM(NSUInteger, BarPosition) {
    BarPositionRight,
    BarPositionLeft,
};

@interface AKBButton : UIButton

@property (nonatomic,assign) NSInteger badgeNumber;
@property (nonatomic,strong) barItemBlock callback;

@end

@interface UIViewController (AKBBarButtonItems)
/**
 *  在vc中重写该方法获得回调事件
 */
- (void)barButtonItemClick:(AKBButton *)btn;

//test
- (void)addWithTitle:(NSString *)title useBlock:(barItemBlock)block;

/**
 *  添加文字按钮，默认添加在右边
 */
- (void)addBarButtonItemWithTitle:(NSString *)title;

- (void)addBarButtonItemWithTitle:(NSString *)title on:(BarPosition)position;

/**
 *  添加多个文字按钮，默认添加在右边
 */
- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles;

- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles on:(BarPosition)position;

/**
 *  添加图片按钮，默认添加在右边
 */
- (void)addBarButtonItemWithImageName:(NSString *)imageName;

- (void)addBarButtonItemWithImageName:(NSString *)imageName on:(BarPosition)position;

/**
 *  添加多个图片按钮，默认添加在右边
 */
- (void)addBarButtonItemWithImageNames:(NSArray<NSString *> *)imageNames;

- (void)addBarButtonItemWithImageNames:(NSArray<NSString *> *)imageNames on:(BarPosition)position;

/**
 *  添加图片+标题按钮，默认添加在右边
 */
- (void)addBarButtonItemWithImageName:(NSString *)imageName title:(NSString *)title;

- (void)addBarButtonItemWithImageName:(NSString *)imageName title:(NSString *)title on:(BarPosition)position;

/**
 *  添加多个图片+标题按钮，默认添加在右边
 */
- (void)addBarButtonItemWithImageNames:(NSArray<NSString *> *)imageNames titles:(NSArray<NSString *> *)titles;

- (void)addBarButtonItemWithImageNames:(NSArray<NSString *> *)imageNames titles:(NSArray<NSString *> *)titles on:(BarPosition)position;

@end
