//     ▁▁       ▁▁  ▁▁   ▁▁
//    /  \      ▏▕ / /   ▏
//   / /\ \     ▏  \/    ▏
//  / /▁▁\ \    ▏ \ \    ▏
// / /▔▔▔▔\ \   ▏▕ \ \   ▏
/// /      \ \  ▏▕  \ \  ▏
//▔▔        ▔▔  ▔▔   ▔▔  ▔▔  TODO:B怎么弄?

#import "UIViewController+AKBBarButtonItems.h"
//#import "UIDevice+Info.h"


@implementation UIViewController (AKBBarButtonItems)

#pragma mark - title
- (void)addBarButtonItemWithTitle:(NSString *)title {
    [self addBarButtonItemWithTitle:title on:BarPositionRight];
}

- (void)addBarButtonItemWithTitle:(NSString *)title on:(BarPosition)position {
    NSMutableArray<UIBarButtonItem *> *arrayM = [self barButtonItemsMutableCopy:position];
    [self addBarButtonItem:[self createBtnWithTitle:title imageName:nil tag:arrayM.lastObject.tag + 1] to:arrayM on:position];
}

- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles {
    [self addBarButtonItemWithTitles:titles on:BarPositionRight];
}

- (void)addBarButtonItemWithTitles:(NSArray<NSString *> *)titles on:(BarPosition)position {
    NSMutableArray<UIBarButtonItem *> *arrayM = [self barButtonItemsMutableCopy:position];
    
    NSInteger tag=arrayM.lastObject.tag;//获取最后一个的tag
    
    for (NSInteger i=0; i<titles.count; i++) {
        [arrayM addObject:[self createBtnWithTitle:titles[i] imageName:nil tag:++tag]];
    }
    
    [self addBarButtonItem:nil to:arrayM on:position];
}

#pragma mark - image
-(void)addBarButtonItemWithImageName:(NSString *)imageName{
    [self addBarButtonItemWithImageName:imageName on:BarPositionRight];
}

-(void)addBarButtonItemWithImageName:(NSString *)imageName on:(BarPosition)position{
    NSMutableArray<UIBarButtonItem *> *arrayM = [self barButtonItemsMutableCopy:position];
    [self addBarButtonItem:[self createBtnWithTitle:nil imageName:imageName tag:arrayM.lastObject.tag + 1] to:arrayM on:position];
}

-(void)addBarButtonItemWithImageNames:(NSArray<NSString *> *)imageNames{
    [self addBarButtonItemWithImageNames:imageNames on:BarPositionRight];
}

-(void)addBarButtonItemWithImageNames:(NSArray<NSString *> *)imageNames on:(BarPosition)position{
    NSMutableArray<UIBarButtonItem *> *arrayM = [self barButtonItemsMutableCopy:position];
    
    NSInteger tag=arrayM.lastObject.tag;//获取最后一个的tag
    
    for (NSInteger i=0; i<imageNames.count; i++) {
        [arrayM addObject:[self createBtnWithTitle:nil imageName:imageNames[i] tag:++tag]];
    }
    
    [self addBarButtonItem:nil to:arrayM on:position];
}

#pragma mark - image+title
/**
 *  添加图片+标题按钮，默认添加在右边
 */
- (void)addBarButtonItemWithImageName:(NSString *)imageName title:(NSString *)title{
    [self addBarButtonItemWithImageName:imageName title:title on:BarPositionRight];
}

- (void)addBarButtonItemWithImageName:(NSString *)imageName title:(NSString *)title on:(BarPosition)position{
    NSMutableArray<UIBarButtonItem *> *arrayM = [self barButtonItemsMutableCopy:position];
    [self addBarButtonItem:[self createBtnWithTitle:title imageName:imageName tag:arrayM.lastObject.tag + 1] to:arrayM on:position];
}

/**
 *  添加多个图片+标题按钮，默认添加在右边
 */
- (void)addBarButtonItemWithImageNames:(NSArray<NSString *> *)imageNames titles:(NSArray<NSString *> *)titles{
    [self addBarButtonItemWithImageNames:imageNames titles:titles on:BarPositionRight];
}

- (void)addBarButtonItemWithImageNames:(NSArray<NSString *> *)imageNames titles:(NSArray<NSString *> *)titles on:(BarPosition)position{
    NSMutableArray<UIBarButtonItem *> *arrayM = [self barButtonItemsMutableCopy:position];
    
    NSInteger tag=arrayM.lastObject.tag;//获取最后一个的tag
    
    for (NSInteger i=0; i<imageNames.count; i++) {
        [arrayM addObject:[self createBtnWithTitle:titles[i] imageName:imageNames[i] tag:++tag]];
    }
    
    [self addBarButtonItem:nil to:arrayM on:position];
}

- (void)removeBarButtonWithTag:(NSInteger)tag {
    NSMutableArray<UIBarButtonItem *> *arrayM = [NSMutableArray arrayWithArray:tag > 9 ? self.navigationItem.rightBarButtonItems : self.navigationItem.leftBarButtonItems];
    for (int i = 0; i < arrayM.count; i ++) {
        if (arrayM[i].tag == tag) {
            [arrayM removeObjectAtIndex:i];
            if (tag > 9) {
                [self.navigationItem setRightBarButtonItems:arrayM animated:YES];
            }
            else {
                [self.navigationItem setLeftBarButtonItems:arrayM animated:YES];
            }
            break;
        }
    }
}

#pragma mark - privte
///获得可变按钮数组，并添加间距
- (NSMutableArray<UIBarButtonItem *> *)barButtonItemsMutableCopy:(BarPosition)position {
    NSMutableArray<UIBarButtonItem *> *arrayM = [NSMutableArray arrayWithArray:position == BarPositionRight ? self.navigationItem.rightBarButtonItems : self.navigationItem.leftBarButtonItems];
    
    if (arrayM.count < 1) {//第一次添加按钮,缩小距离屏幕边缘的间距
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        space.width =- 10;
        space.tag = position == BarPositionRight ? 9 : 0;
        [arrayM addObject:space];
    }
    return arrayM;
}

///添加按钮的放入方法里调用,代码复用
- (void)addBarButtonItem:(UIBarButtonItem *)item to:(NSMutableArray<UIBarButtonItem *> *)arrayM on:(BarPosition)position {
    if (item!=nil) {
        [arrayM addObject:item];
    }
    
    if (position == BarPositionRight) {
        self.navigationItem.rightBarButtonItems = arrayM;
    }
    else {
        self.navigationItem.leftBarButtonItems = arrayM;
    }
}

#pragma mark - UIBarButtonItem
- (UIBarButtonItem *)createBtnWithTitle:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag {
    AKBButton *btn = [AKBButton buttonWithType:UIButtonTypeCustom];
    
    if (title.length > 0) {//添加标题
        [btn setTitle:title forState:UIControlStateNormal];
        CGFloat size = 16.0;
        if ([UIScreen mainScreen].scale > 2.0) {//6plus
            size *= 1.5;
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:size];
        [btn setTitleColor:[UIColor colorWithWhite:1.0 alpha:.5] forState:UIControlStateHighlighted];
    }
    
    if (imageName.length > 0) {//添加图片
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
//    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);// TODO: 大小还需根据真机使用情况进行调整
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    item.tag = btn.tag = tag;
    return item;
}

#pragma mark - public
- (void)barButtonItemClick:(AKBButton *)btn {
//    NSLog(@"%@",btn);
}

-(AKBButton *)barButtonWithTag:(NSInteger)tag{
    if (tag>0 && tag<9) {
        for (UIBarButtonItem *item in self.navigationItem.leftBarButtonItems) {
            if (tag==item.tag) return item.customView;
        }
    }
    
    if (tag>9) {
        for (UIBarButtonItem *item in self.navigationItem.rightBarButtonItems) {
            if (tag==item.tag) return item.customView;
        }
    }
    
    return nil;
}

//test
- (void)addWithTitle:(NSString *)title useBlock:(barItemBlock)block{
    AKBButton *btn=[AKBButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.callback=block;
    [btn addTarget:self action:@selector(blockCallback:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
}

-(void)blockCallback:(AKBButton *)btn{
    btn.callback(btn);
}






@end

#pragma mark - AKBButton
@interface AKBButton ()

@property (nonatomic,weak) UILabel *badgeLabel;

@end


@implementation AKBButton


-(void)setBadgeNumber:(NSInteger)badgeNumber{
    if (_badgeNumber!=badgeNumber) {
        _badgeNumber=badgeNumber;
        
        if (_badgeNumber==0) {
            [_badgeLabel removeFromSuperview];
            return;
        }
        
        if (_badgeNumber<0) {
            self.badgeLabel.text=nil;
            _badgeLabel.frame=CGRectMake(0, 0, 10, 10);
            _badgeLabel.center=CGPointMake(self.bounds.size.width-10, 10);
        }
        else{
            self.badgeLabel.text=_badgeNumber<99?[NSString stringWithFormat:@"%zi",_badgeNumber]:@"99";
            //setFrame
            [_badgeLabel sizeToFit];
            CGFloat size=MAX(_badgeLabel.bounds.size.height, _badgeLabel.bounds.size.width)+4;
            _badgeLabel.frame=CGRectMake(self.bounds.size.width-size, 0, size, size);//右上角
        }
        _badgeLabel.layer.cornerRadius=_badgeLabel.frame.size.height/2;
    }
}

- (UILabel *)badgeLabel {
    if (!_badgeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor=[UIColor redColor];
        label.textColor=[UIColor whiteColor];
        CGFloat size = 11.0;
        if ([UIScreen mainScreen].scale > 2.0) {//6plus
            size *= 1.5;
        }
        label.font=[UIFont systemFontOfSize:size];
        label.layer.masksToBounds=YES;
        label.textAlignment=NSTextAlignmentCenter;
        _badgeLabel=label;
        [self addSubview:_badgeLabel];
    }
    return _badgeLabel;
}

-(void)dealloc{
    NSLog(@"btn被销毁");
}

@end





