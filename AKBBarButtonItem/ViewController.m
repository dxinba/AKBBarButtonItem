
#import "ViewController.h"
#import "UIViewController+AKBBarButtonItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.akb_imageAndTitle(@"star_h",@"asd").akb_onLeft();
//    self.akb_title(@"asd").akb_item([[UIBarButtonItem alloc] initWithTitle:@"asd" style:UIBarButtonItemStylePlain target:self action:@selector(barBtnItemClick)]).akb_onLeft();
//    
//    self.akb_image(@"star_h").akb_item([[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"star_h"] style:UIBarButtonItemStylePlain target:self action:@selector(barBtnItemClick)]).akb_onRight();
}

- (void)barBtnItemClick {
    NSLog(@"as");
}

- (void)akb_barButtonItemClick:(UIButton *)sender {
    NSLog(@"%zi",sender.tag);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

-(void)dealloc{
    NSLog(@"controller被销毁");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
