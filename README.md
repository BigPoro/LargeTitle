早在几个月前，iOS11正式版发布，我就被新的UI设计给震惊了，尤其是那"大黑粗"的大标题，简单粗暴的美。
### 说下大标题设计的背景
摘自知乎
>这是从硅谷风靡开来的设计趋势Complexion Reduction（简称CR），主要特点就是黑白极简的界面、色块图标弱化、标题大黑粗，让内容信息成为页面的重心。
>在一众设计感十足、配色图标排版都过于花心思的App里，不走寻常路，杀出重围，逐渐成为被公认的设计原则之一。

随后正好项目UI重新打板，很正常的，我们的射鸡湿，义正言辞的抄了一波。然后我们又开始折腾了。

因为项目需要适配iOS8.0以上的系统，所以，自定义一个大标题难以避免。

因为水平有限，难免有不足之处，请见谅，欢迎交流。

先上图。

![](http://ozc9ykayb.bkt.clouddn.com/18-1-16/47396014.jpg)

### 简单说下实现的思路
首先基本思路是这个[哥们的](http://www.cnblogs.com/someonelikeyou/p/7353872.html),
然后在阅读源码时结合实际需求，做出了一点改进。

- 首先，自定义了NormalNavView、BigTitleView，NormalNavView负责充当NavigationBar, BigTitleView负责充当大标题
- 然后，将这两个控件添加到一个DynamicNavView的视图上，构成完整的大标题模块。
- 最后，写了个UIViewController的分类，通过Runtime,将DynamicNavView绑定为UIViewController的一个属性

### 调用的方法如下:
* ` [self defaultShowDynamicNav]; `
> 【1】放在tableView 的上层

* ` [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
make.top.equalTo(@(self.dynamicNavView.dynamicBottom));             make.left.right.bottom.equalTo(self.view);
}];`
>【2】修改起始高度

*  `tableView.contentInset = UIEdgeInsetsMake(self.dynamicNavView.bigTitleView.hf_height, 0, 0, 0);`
> 【3】为了连贯联动效果

*  `[tableView setContentOffset:CGPointMake(self.view.hf_width, - self.dynamicNavView.bigTitleView.hf_height) animated:NO];`
>【4】为了连贯联动效果

* `[self showDynamicBarAnimationWithScrollView:scrollView]; `
>【5】选择性实现 该代码选择实现 需要导航折叠Animation 就要在该代理方法里面实现 不滚动就是默认大标题

最后附上Demo的地址，[传送门](https://github.com/BigPoro/LargeTitle)。
