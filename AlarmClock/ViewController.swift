//
//  ViewController.swift
//  AlarmClock
//
//  Created by 공학관559 on 9/17/25.
//

import UIKit

class ViewController: UIViewController
{
    var alarmTime: Date?
    let timeSelector: Selector = #selector(updateTime)
    let interval: TimeInterval = 1.0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        updateTime()
    }
    
    @objc func updateTime()
    {
        let currentDate = NSDate() as Date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: currentDate)
        
        if let alarm = alarmTime
        {
            let calendar = Calendar.current
            
            let currentComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
            let alarmComponents = calendar.dateComponents([.year, .month, .day], from: alarm)
            
            if currentComponents == alarmComponents
            {
                view.backgroundColor = UIColor.red
            }
            else
            {
                view.backgroundColor = UIColor.white
            }
        }
        else
        {
            // 알람이 아직 설정되지 않은 경우 기본 배경
            view.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker)
    {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        let date = datePickerView.date
        lblPickerTime.text = "선택시간: " + formatter.string(from: date)
        alarmTime = date
    }
    
}
