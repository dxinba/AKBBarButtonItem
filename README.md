# AKBBarButtonItem

用 `UIViewController` 类别来封装 `UIBarButtonItem` 的添加和移除方法

## 使用方法
* 添加纯文本按钮
	* 添加一个   
	
	``` objc
	self.akb_title(@"按钮A").akb_onLeft();
	```
	
	* 添加多个   
	
	``` objc
	self.akb_title(@[@"按钮A", @"按钮B",...]).akb_onLeft();
	```
	
* 添加纯图片按钮
	* 添加一个   
	
	``` objc
	self.akb_image(@"图片名A").akb_onRight();
	```
	
	* 添加多个   
	
	``` objc
	self.akb_image(@[@"图片名A", @"图片名B",...]).akb_onRight();
	```
	
* 添加图片+标题按钮

	``` objc
	self.akb_imageAndTitle(@"图片名A", @"按钮A").akb_onRight();
	```	
	
## 点击事件
> 在controller中重写👇的方法即可，` tag `都是不一样的。

``` objc
- (void)akb_barButtonItemClick:(UIButton *)sender {
    NSLog(@"%zi",sender.tag);
}
```

* 还有更多方法，[请前往源代码查看。](https://github.com/dxinba/AKBBarButtonItem/archive/master.zip)