//
//  TodayViewController.swift
//  todayExtension
//
//  Created by 安丹阳 on 2017/12/6.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    
      shareData()
      let tap = UITapGestureRecognizer(target: self, action: #selector(self.open))
      self.view.addGestureRecognizer( tap )
    }
  
  //每次会调用
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadData()
  }
  
  //今日扩展的刷新设置
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
      
        loadData()
        completionHandler(NCUpdateResult.newData)
    }
  
  
  func loadData(){
    
    if let data = try? Data.init(contentsOf: URL(string: "http://www.dyyxclub.com/uploadfile/2017/1025/20171025031908753.jpg")!){
      
      imageView.image = UIImage(data: data)
    }
  }
  
  func shareData(){
    
    //set
    let shared = UserDefaults(suiteName: "group.com.luxcon.test.Extension")
    shared?.set("test data 12343435", forKey: "Today_Extension_data")
    
    //get
    shared?.value(forKey: "Today_Extension_data")
  }
  
  //跳转到主app不同页面，widget里是没有UIApplication类的，所以相关方法都不能用，所以self.extensionContext代指当前widget
  @objc func open()  {
    self.extensionContext?.open(URL(string: "PushTest://action=GotoHomePage")!, completionHandler: { (isfinsih) in
      
    })
  }
}


