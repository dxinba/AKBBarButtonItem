
#import "UIViewController+AKBBarButtonItem.h"
#import <objc/runtime.h>

@implementation UIViewController (AKBBarButtonItem)

#pragma mark - 添加属性
///暂存按钮
- (NSMutableArray<UIBarButtonItem *> *)akb_Items {
    //_cmd在Objective-C的方法中表示当前方法的selector，正如同self表示当前方法调用的对象实例。_cmd == @selector(akb_Items)
    NSMutableArray *arrayM = objc_getAssociatedObject(self, _cmd);
    if (!arrayM) {
        arrayM = [NSMutableArray array];
        [self akb_setItems:arrayM];
    }
    return arrayM;
}

- (void)akb_setItems:(NSMutableArray<UIBarButtonItem *> *)items {
    objc_setAssociatedObject(self, @selector(akb_Items), items, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - public
- (UIViewController *(^)(id))akb_title {
    return ^UIViewController *(id title) {
        NSMutableArray *items = [self akb_Items];
        if ([title isKindOfClass:[NSString class]]) {
            [items addObject:[self akb_createBtnWithTitle:title image:nil]];
        } else {
            for (NSString *str in title) {
                [items addObject:[self akb_createBtnWithTitle:str image:nil]];
            }
        }
        return self;
    };
}

- (UIViewController *(^)(id))akb_image {
    return ^UIViewController *(id image) {
        NSMutableArray *items = [self akb_Items];
        if ([image isKindOfClass:[NSString class]]) {
            [items addObject:[self akb_createBtnWithTitle:nil image:image]];
        } else {
            for (NSString *str in image) {
                [items addObject:[self akb_createBtnWithTitle:nil image:str]];
            }
        }
        return self;
    };
}

- (UIViewController *(^)(NSString *, NSString *))akb_imageAndTitle {
    return ^UIViewController *(NSString *image,NSString *title) {
        [[self akb_Items] addObject:[self akb_createBtnWithTitle:title image:image]];
        return self;
    };
}

- (UIViewController *(^)(UIBarButtonItem *))akb_item {
    return ^UIViewController *(UIBarButtonItem *item) {
        [[self akb_Items] addObject:item];
        return self;
    };
}

- (UIViewController *(^)())akb_addBackButton {
    return ^UIViewController *(UIBarButtonItem *item) {
        NSMutableArray<UIBarButtonItem *> *arrayM=[self akb_barButtonItemsMutableCopyOnLeft:YES];
        [arrayM addObject:[self akb_backButton]];
        return self;
    };
}

- (void (^)())akb_onLeft {
    return ^(){
        [self akb_addBarButtonItemOnLeft:YES];
    };
}

- (void (^)())akb_onRight {
    return ^(){
        [self akb_addBarButtonItemOnLeft:NO];
    };
}

- (UIButton *)akb_getBarButtonWithTag:(NSInteger)tag {
    if (tag>0 && tag<10) {
        for (UIBarButtonItem *item in self.navigationItem.leftBarButtonItems) {
            if (tag==item.tag) return item.customView;
        }
    }
    
    if (tag > 10) {
        for (UIBarButtonItem *item in self.navigationItem.rightBarButtonItems) {
            if (tag==item.tag) return item.customView;
        }
    }
    
    return nil;
}

- (void)akb_removeBarButtonWithTag:(NSInteger)tag {
    NSMutableArray<UIBarButtonItem *> *arrayM = [NSMutableArray arrayWithArray:tag > 10 ? self.navigationItem.rightBarButtonItems : self.navigationItem.leftBarButtonItems];
    for (NSInteger i = 0; i < arrayM.count; i ++) {
        if (arrayM[i].tag == tag) {
            [arrayM removeObjectAtIndex:i];
            if (tag > 10)
                [self.navigationItem setRightBarButtonItems:arrayM animated:YES];
            else
                [self.navigationItem setLeftBarButtonItems:arrayM animated:YES];
            break;
        }
    }
}

#pragma mark - privte
///获得可变按钮数组，并添加间距
- (NSMutableArray<UIBarButtonItem *> *)akb_barButtonItemsMutableCopyOnLeft:(BOOL)left {
    NSMutableArray<UIBarButtonItem *> *arrayM = [NSMutableArray arrayWithArray:left ? self.navigationItem.leftBarButtonItems : self.navigationItem.rightBarButtonItems];
    
    if (arrayM.count < 1) {//第一次添加按钮,缩小距离屏幕边缘的间距
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        space.width =- 10;
        space.tag = left ? 0 : 10;
        [arrayM addObject:space];
    }
    return arrayM;
}

///添加按钮的放入方法里调用,代码复用
- (void)akb_addBarButtonItemOnLeft:(BOOL)left {
    NSMutableArray<UIBarButtonItem *> *arrayM=[self akb_barButtonItemsMutableCopyOnLeft:left];
    
    NSMutableArray *items = [self akb_Items];
    for (UIBarButtonItem *item in items) {
        item.tag = item.customView.tag = arrayM.lastObject.tag + 1;
        [arrayM addObject:item];
    }
    
    [items removeAllObjects];
    [self akb_setItems:nil];
    
    if (left)
        self.navigationItem.leftBarButtonItems = arrayM;
    else
        self.navigationItem.rightBarButtonItems = arrayM;
    
}

#pragma mark - 创建按钮
- (UIBarButtonItem *)akb_createBtnWithTitle:(NSString *)title image:(NSString *)image {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title.length > 0) {//添加标题
        [btn setTitle:title forState:UIControlStateNormal];
        CGFloat size = 16.0;
        if ([UIScreen mainScreen].scale > 2.0) {//plus
            size *= 1.5;
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:size];
        [btn setTitleColor:[UIColor colorWithWhite:1.0 alpha:.3] forState:UIControlStateHighlighted];
    }
    
    if (image.length > 0) {//添加图片
        UIImage *img = [UIImage imageNamed:image];
        [btn setImage:img forState:UIControlStateNormal];
        btn.adjustsImageWhenHighlighted=NO;
        dispatch_async(dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [btn setImage:[self akb_imageByApplyingAlpha:0.3 image:img] forState:UIControlStateHighlighted];
        });
    }
    
    //    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(akb_barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);// TODO: 大小还需根据真机使用情况进行调整
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

//设置图片透明度
- (UIImage *)akb_imageByApplyingAlpha:(CGFloat)alpha image:(UIImage*)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - AKBBarButtonItemDelegate
- (UIBarButtonItem *)akb_backButton {
    return [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(akb_backButtonItemClick)];
}

#pragma mark -
- (void)akb_barButtonItemClick:(UIButton *)sender {
    
}

- (void)akb_backButtonItemClick {
    
}

@end
