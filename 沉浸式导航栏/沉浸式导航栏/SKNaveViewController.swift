//
//  SKNaveViewController.swift
//  沉浸式导航栏
//
//  Created by XunLi on 2017/5/31.
//  Copyright © 2017年 XunLi. All rights reserved.
//

import UIKit

class SKNaveViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default);
        self.navigationBar.shadowImage = UIImage();
        
        self.navigationBar.backgroundColor = UIColor.clear;
        self.navigationBar.tintColor = UIColor.black;
        self.navigationBar.barStyle = UIBarStyle.default;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
