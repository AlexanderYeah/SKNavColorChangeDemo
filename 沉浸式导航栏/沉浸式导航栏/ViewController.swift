//
//  ViewController.swift
//  沉浸式导航栏
//
//  Created by XunLi on 2017/5/26.
//  Copyright © 2017年 XunLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var navImgView = UIImageView();
    
    var previousY = 0;
    
    // 轮播图的数组
    var imgArray = [String]();
    // 定时器
    var timer : Timer!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 导航栏标题
        self.navigationItem.title = "导航栏标题";
        // imgArray 装图片
        imgArray.append("1");
        imgArray.append("2");
        imgArray.append("3");
        
        // 创建主TableView
        self.view.addSubview(mainTbView);
        // 创建定时器
        createTimer();
        
        
        
        
        
        
    }
// MARK: 创建定时器
    private func createTimer (){
        // 如果定时器不为空，直接清空
        if timer != nil {
            
            timer.invalidate();
            timer = nil;
        }
        // 创建定时器
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true);
        
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes);
        
        
    }
// MARK: 定时器调用的方法
    @objc private func timerRun(){
        
    
    }
    
    
    
// MARK: 代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID";
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID);
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID);
        }
       
        let str = "这是第\(indexPath.row)行";
        
        cell?.textLabel?.text = str;
        
        return cell!;
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView();
        view.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 180);
        view.backgroundColor = UIColor.white.withAlphaComponent(0);
        
        
        for i in 0 ..< imgArray.count {
            let imgView = UIImageView(frame: CGRect(x: kScreenW * CGFloat(i), y: 0, width: kScreenW, height: 180));
            imgView.image = UIImage(named: imgArray[i]);
            
            adScrollView.addSubview(imgView);
            
        }
        
        view.addSubview(adScrollView);
        view.addSubview(pageIndicatorView);
        return view;
    }
    
    
// MARK:改变导航栏颜色的代理方法
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
            // 当手指上划的时候，改变导航栏颜色
            let tbY = mainTbView.contentOffset.y;
            // 随着手指上划的来做颜色的透明度，这里是写死的200
            let alpha = tbY / 400;
        
            if Int(tbY) > previousY { // 上划
                
                self.navigationController?.navigationBar.backgroundColor = UIColor.red.withAlphaComponent(alpha);
                
            }
        
            if tbY <= 0 {
                self.navigationController?.navigationBar.backgroundColor = UIColor.clear.withAlphaComponent(alpha);
            
            }
            
            
            previousY = Int(tbY);
  
    }
    
    
    
    // MARK: 创建主TableView
    private lazy var mainTbView:UITableView = {
        let tb = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH), style: UITableViewStyle.plain);
        tb.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
        tb.dataSource = self;
        tb.delegate = self;
        tb.sectionHeaderHeight = 180;
        return tb;
        
    }()
    
    // MARK: 创建scrollView
    private lazy var adScrollView:UIScrollView = {
        let sc = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 180));
        sc.delegate = self;
        sc.showsHorizontalScrollIndicator = false;
        sc.bounces = false;
        sc.isPagingEnabled = true;
        sc.contentSize = CGSize(width: kScreenW * 3, height: 0);
        return sc;
    }()
    
    // MARK: 创建indicator
    private lazy var pageIndicatorView:UIPageControl = {
        let pc = UIPageControl(frame: CGRect(x: kScreenW/2 - 75, y: 150, width: 150, height: 30));
        pc.currentPageIndicatorTintColor = UIColor.blue;
        pc.pageIndicatorTintColor = UIColor.white;
        pc.numberOfPages = 3;
        return pc;
    }()




    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

