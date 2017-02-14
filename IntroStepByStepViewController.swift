//
//  IntroStepByStepViewController.swift
//  Copad
//
//  Created by Cheng-Lung on 2017/2/9.
//  Copyright © 2017年 Cheng-Lung. All rights reserved.
//

import UIKit

class IntroStepByStepViewController: UIViewController, UIScrollViewDelegate {
    var myScrollView: UIScrollView!
    var pageControl: UIPageControl!
    var fullSize :CGSize!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 取得螢幕的尺寸
        fullSize = UIScreen.main.bounds.size
        
        // 建立 UIScrollView
        myScrollView = UIScrollView()
        
        // 設置尺寸 也就是可見視圖範圍
        myScrollView.frame = CGRect(
            x: 0, y: 20,
            width: fullSize.width, height: fullSize.height - 20)
        
        // 實際視圖範圍
        myScrollView.contentSize = CGSize(
            width: fullSize.width * 5, height: fullSize.height - 20)
        
        // 是否顯示滑動條
        myScrollView.showsHorizontalScrollIndicator = false
        myScrollView.showsVerticalScrollIndicator = false
        
        // 滑動超過範圍時是否使用彈回效果
        myScrollView.bounces = true
        
        // 設置委任對象
        myScrollView.delegate = self
        
        // 以一頁為單位滑動
        myScrollView.isPagingEnabled = true
        
        // 加入到畫面中
        self.view.addSubview(myScrollView)
        
        // 建立 UIPageControl 設置位置及尺寸
        pageControl = UIPageControl(frame: CGRect(
            x: 0, y: 0, width: fullSize.width * 0.85, height: 50))
        pageControl.center = CGPoint(
            x: fullSize.width * 0.5, y: fullSize.height * 0.85)
        
        // 有幾頁 就是有幾個點點
        pageControl.numberOfPages = 5
        
        // 起始預設的頁數
        pageControl.currentPage = 0
        
        // 目前所在頁數的點點顏色
        pageControl.currentPageIndicatorTintColor =
            UIColor.black
        
        // 其餘頁數的點點顏色
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        // 增加一個值改變時的事件
        pageControl.addTarget(
            self,
            action: #selector(self.pageChanged),
            for: .valueChanged)
        
        // 加入到基底的視圖中 (不是加到 UIScrollView 裡)
        // 因為比較後面加入 所以會蓋在 UIScrollView 上面
        self.view.addSubview(pageControl)
        
        // 建立 5 個 UILabel 來顯示每個頁面內容
        var myLabel = UILabel()
        for i in 0...4 {
            myLabel = UILabel(frame: CGRect(
                x: 0, y: 0, width: fullSize.width, height: 40))
            myLabel.center = CGPoint(
                x: fullSize.width * (0.5 + CGFloat(i)),
                y: fullSize.height * 0.2)
            myLabel.font = UIFont(name: "Helvetica-Light", size: 48.0)
            myLabel.textAlignment = .center
            myLabel.text = "\(i + 1)"
            myScrollView.addSubview(myLabel)
        }
        
        //button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        button.center = CGPoint(
            x: fullSize.width * (0.60 + CGFloat(0)),
            y: fullSize.height * 0.60)

        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        
        // 按鈕按下後的動作
        button.addTarget(
            self,
            action: #selector(self.clickButton),
            for: .touchUpInside)
        
        myScrollView.addSubview(button)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 滑動結束時
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 左右滑動到新頁時 更新 UIPageControl 顯示的頁數
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = page
    }
    
    // 點擊點點換頁
    func pageChanged(sender: UIPageControl) {
        // 依照目前圓點在的頁數算出位置
        var frame = myScrollView.frame
        frame.origin.x =
            frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        
        // 再將 UIScrollView 滑動到該點
        myScrollView.scrollRectToVisible(frame, animated:true)
    }
    
    func clickButton() {
        // 為基底的 self.view 的底色在黑色與白色兩者間切換
        performSegue(withIdentifier: "nextView", sender: self)
        /*if self.view.backgroundColor!.isEqual(
            UIColor.white) {
            self.view.backgroundColor =
                UIColor.black
        } else {
            self.view.backgroundColor =
                UIColor.white
        }*/
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
