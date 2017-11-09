//
//  ViewController.swift
//  ScycleScrollView
//
//  Created by 安然  on 2017/11/9.
//  Copyright © 2017年 安然 . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0,
                             width: view.bounds.size.width,
                             height: 100)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()

    /*
     let imagesUrl = ["http://g.hiphotos.baidu.com/lvpics/w=1000/sign=1be9ee3b2f34349b74066a85f9da14ce/3801213fb80e7bec6a230cc0282eb9389b506b11.jpg",
     "http://g.hiphotos.baidu.com/lvpics/w=1000/sign=1be9ee3b2f34349b74066a85f9da14ce/3801213fb80e7bec6a230cc0282eb9389b506b11.jpg",
     "http://g.hiphotos.baidu.com/lvpics/w=1000/sign=1be9ee3b2f34349b74066a85f9da14ce/3801213fb80e7bec6a230cc0282eb9389b506b11.jpg",
     "http://g.hiphotos.baidu.com/lvpics/w=1000/sign=1be9ee3b2f34349b74066a85f9da14ce/3801213fb80e7bec6a230cc0282eb9389b506b11.jpg" ,
     "http://g.hiphotos.baidu.com/lvpics/w=1000/sign=1be9ee3b2f34349b74066a85f9da14ce/3801213fb80e7bec6a230cc0282eb9389b506b11.jpg"]
     */
    // 图片
    let images = [UIImage(named:"1"),
                  UIImage(named: "2"),
                  UIImage(named: "3"),
                  UIImage(named: "4"),
                  UIImage(named:"5")]
    // 标题个数要和图片个数相同
    let titles = ["这是第1个页面",
                  "这是第2个页面",
                  "这是第3个页面",
                  "这是第4个页面",
                  "这是第5个页面"]
    
    var cycleView1: MagiCycleView!
    var cycleView2: MagiCycleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(messageLabel)
        // 添加第一个 带标题
        addcycleView1()
        // 添加第二个 不带标题
        addcycleView2()
    }
    
    func addcycleView1()  {
        
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

    }
    
    
    func addcycleView2()  {
        
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


