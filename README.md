# MagiCycleView
Swift自动轮播器

最近公司正在写新的项目,老项目中的轮播器存在不同的bug,所以重新写了一个与一般的轮播器一样.

不过作为练习我还用了不同的方法,老版的使用了代理,类似于Deletegate, 和 datasource ;
而我这个使用闭包,还简单的使用了链式编程

---
![这是列子](https://github.com/AnRanScheme/MagiCycleView/raw/master/Untitled.gif)

使用方法

- 使用类方法

        cycleView2 = MagiCycleView.MagiCycleViewWithImagesCount({ () -> Int in
            return self.images.count
        })
            
            .setupImageAndTitle({ (titleLabel, imageView, index) in
                imageView.image = self.images[index]
                titleLabel.text = self.titles[index]
                titleLabel.textColor = UIColor.red
        })
        
            .setupPageDidClickAction({ (clickedIndex) in
                // 处理点击
                print(clickedIndex)
                self.messageLabel.text = "点击了第\(clickedIndex + 1)张图片"
            })

        
        cycleView2.frame = CGRect(x: 0, y: 310,
                                  width: view.bounds.size.width,
                                  height: 200)
        //设置pageController的颜色
        cycleView2.pageIndicatorTintColor = UIColor.white
        cycleView2.currentPageIndicatorTintColor = UIColor.brown
        cycleView2.pageControlPosition = .BottomCenter
        view.addSubview(cycleView2)
        /*
        // 滚动间隔, 默认三秒
        cycleView2.timerInterval = 2.0
        
        // 关闭自动滚动
        cycleView2.autoScorll = false
        
        /// 如果是网络获取到的信息, 获取完毕可以调用reloadData()重新加载页面
        cycleView2.reloadData()
        */
        
- 使用便利方法

        cycleView1 = MagiCycleView(imagesCount: { () -> Int in
            return self.images.count
        },
                                   setupImageAndTitle: { (titleLabel, imageView, index) in
                                    imageView.image = self.images[index]
                                    titleLabel.text = self.titles[index]
                                    titleLabel.textColor = UIColor.red
        }, pageDidClick: { (clickedIndex) in
            print(clickedIndex)
            self.messageLabel.text = "点击了第\(clickedIndex + 1)张图片"
        })
        
        cycleView1.frame = CGRect(x: 0,
                                y: 100,
                                width: view.bounds.size.width,
                                height: 200)
        //设置pageController的颜色
        cycleView1.pageIndicatorTintColor = UIColor.white
        cycleView1.currentPageIndicatorTintColor = UIColor.brown
        cycleView1.pageControlPosition = .TopLeft
        view.addSubview(cycleView1)
        /*
        // 滚动间隔, 默认三秒
        pptView.timerInterval = 2.0
        // 关闭自动滚动
        cycleView1.autoScroll = false
        /// 如果是网络获取到的信息, 获取完毕可以调用reloadData()重新加载页面
        cycleView1.reloadData()
        */
        
        

如何实现请看我的简书要是有问题欢迎指正[更详细的介绍在简书中哦](http://www.jianshu.com/p/ee18d36c50ce)
还有后续更新的哈
