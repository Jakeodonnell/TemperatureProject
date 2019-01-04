//
//  GraphViewController.swift
//  tempapp
//
//  Created by Jake O´Donnell on 2018-12-21.
//  Copyright © 2018 Jake O´Donnell. All rights reserved.
//

import UIKit
import Charts
import FirebaseDatabase
import Firebase

class GraphViewController: UIViewController {
    var tempString: String = ""
    var maxTemp: Int = 0
    var DayLow: Int = -17
    var DayHigh: Int = 0

    
    let Info: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let Info2: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    @IBOutlet weak var time0000: UIView!
    @IBOutlet weak var time0100: UIView!
    @IBOutlet weak var time0200: UIView!
    @IBOutlet weak var time0300: UIView!
    @IBOutlet weak var time0400: UIView!
    @IBOutlet weak var time0500: UIView!
    @IBOutlet weak var time0600: UIView!
    @IBOutlet weak var time0700: UIView!
    @IBOutlet weak var time0800: UIView!
    @IBOutlet weak var time0900: UIView!
    @IBOutlet weak var time1000: UIView!
    @IBOutlet weak var time1100: UIView!
    @IBOutlet weak var time1200: UIView!
    @IBOutlet weak var time1300: UIView!
    @IBOutlet weak var time1400: UIView!
    @IBOutlet weak var time1500: UIView!
    @IBOutlet weak var time1600: UIView!
    @IBOutlet weak var time1700: UIView!
    @IBOutlet weak var time1800: UIView!
    @IBOutlet weak var time1900: UIView!
    @IBOutlet weak var time2000: UIView!
    @IBOutlet weak var time2100: UIView!
    @IBOutlet weak var time2200: UIView!
    @IBOutlet weak var time2300: UIView!
    
    
    let screenSize:CGRect = UIScreen.main.bounds

    override func viewDidLoad() {
        view.backgroundColor =
            UIColor.backgroundColor
        
        time0000.center = view.center
        time0000.layer.cornerRadius = 5
        time0000.frame.origin.x = time0000.frame.origin.x - 110
        time0000.frame.origin.y = time0000.frame.origin.y - time0000.frame.height/2 - 10

        time0100.center = view.center
        time0100.layer.cornerRadius = 5
        time0100.frame.origin.x = time0100.frame.origin.x - 90
        time0100.frame.origin.y = time0100.frame.origin.y - time0100.frame.height/2 - 10

        time0200.center = view.center
        time0200.layer.cornerRadius = 5
        time0200.frame.origin.x = time0200.frame.origin.x - 70
        time0200.frame.origin.y = time0200.frame.origin.y - time0200.frame.height/2 - 10

        time0300.center = view.center
        time0300.layer.cornerRadius = 5
        time0300.frame.origin.x = time0300.frame.origin.x - 50
        time0300.frame.origin.y = time0300.frame.origin.y - time0300.frame.height/2 - 10

        time0400.center = view.center
        time0400.layer.cornerRadius = 5
        time0400.frame.origin.x = time0400.frame.origin.x - 30
        time0400.frame.origin.y = time0400.frame.origin.y - time0400.frame.height/2 - 10

        time0500.center = view.center
        time0500.layer.cornerRadius = 5
        time0500.frame.origin.x = time0500.frame.origin.x - 10
        time0500.frame.origin.y = time0500.frame.origin.y - time0500.frame.height/2 - 10
        

        time0600.center = view.center
        time0600.layer.cornerRadius = 5
        time0600.frame.origin.x = time0600.frame.origin.x + 10
        time0600.frame.origin.y = time0600.frame.origin.y - time0600.frame.height/2 - 10

        
        time0700.center = view.center
        time0700.layer.cornerRadius = 5
        time0700.frame.origin.x = time0700.frame.origin.x + 30
        time0700.frame.origin.y = time0700.frame.origin.y - time0700.frame.height/2 - 10

        
        time0800.center = view.center
        time0800.layer.cornerRadius = 5
        time0800.frame.origin.x = time0800.frame.origin.x + 50
        time0800.frame.origin.y = time0800.frame.origin.y - time0800.frame.height/2 - 10

        
        time0900.center = view.center
        time0900.layer.cornerRadius = 5
        time0900.frame.origin.x = time0900.frame.origin.x + 70
        time0900.frame.origin.y = time0900.frame.origin.y - time0900.frame.height/2 - 10

        
        time1000.center = view.center
        time1000.layer.cornerRadius = 5
        time1000.frame.origin.x = time1000.frame.origin.x + 90
        time1000.frame.origin.y = time1000.frame.origin.y - time1000.frame.height/2 - 10

        
        time1100.center = view.center
        time1100.layer.cornerRadius = 5
        time1100.frame.origin.x = time1100.frame.origin.x + 110
        time1100.frame.origin.y = time1100.frame.origin.y - time1100.frame.height/2 - 10
        
        time1200.center = view.center
        time1200.layer.cornerRadius = 5
        time1200.frame.origin.x = time1200.frame.origin.x - 110
        time1200.frame.origin.y = time1200.frame.origin.y + time1200.frame.height/2 + 10

        
        time1300.center = view.center
        time1300.layer.cornerRadius = 5
        time1300.frame.origin.x = time1300.frame.origin.x - 90
        time1300.frame.origin.y = time1300.frame.origin.y + time1300.frame.height/2 + 10

        time1400.center = view.center
        time1400.layer.cornerRadius = 5
        time1400.frame.origin.x = time1400.frame.origin.x - 70
        time1400.frame.origin.y = time1400.frame.origin.y + time1300.frame.height/2 + 10
        
        time1500.center = view.center
        time1500.layer.cornerRadius = 5
        time1500.frame.origin.x = time1500.frame.origin.x - 50
        time1500.frame.origin.y = time1500.frame.origin.y + time1300.frame.height/2 + 10
        
        time1600.center = view.center
        time1600.layer.cornerRadius = 5
        time1600.frame.origin.x = time1600.frame.origin.x - 30
        time1600.frame.origin.y = time1600.frame.origin.y + time1300.frame.height/2 + 10
        
        time1700.center = view.center
        time1700.layer.cornerRadius = 5
        time1700.frame.origin.x = time1700.frame.origin.x - 10
        time1700.frame.origin.y = time1700.frame.origin.y + time1300.frame.height/2 + 10
        
        time1800.center = view.center
        time1800.layer.cornerRadius = 5
        time1800.frame.origin.x = time1800.frame.origin.x + 10
        time1800.frame.origin.y = time1800.frame.origin.y + time1300.frame.height/2 + 10
        
        time1900.center = view.center
        time1900.layer.cornerRadius = 5
        time1900.frame.origin.x = time1900.frame.origin.x + 30
        time1900.frame.origin.y = time1900.frame.origin.y + time1300.frame.height/2 + 10
        
        time2000.center = view.center
        time2000.layer.cornerRadius = 5
        time2000.frame.origin.x = time2000.frame.origin.x + 50
        time2000.frame.origin.y = time2000.frame.origin.y + time1300.frame.height/2 + 10
        
        
        time2100.center = view.center
        time2100.layer.cornerRadius = 5
        time2100.frame.origin.x = time2100.frame.origin.x + 70
        time2100.frame.origin.y = time2100.frame.origin.y + time1300.frame.height/2 + 10
        
        time2200.center = view.center
        time2200.layer.cornerRadius = 5
        time2200.frame.origin.x = time2200.frame.origin.x + 90
        time2200.frame.origin.y = time2200.frame.origin.y + time1300.frame.height/2 + 10
        
        time2300.center = view.center
        time2300.layer.cornerRadius = 5
        time2300.frame.origin.x = time2300.frame.origin.x + 110
        time2300.frame.origin.y = time2300.frame.origin.y + time1300.frame.height/2 + 10
        
       

        super.viewDidLoad()
        
        let ref = Database.database().reference().child("0000")
        ref.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0000.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0000.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref1 = Database.database().reference().child("0100")
        ref1.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0100.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0100.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref2 = Database.database().reference().child("0200")
        ref2.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0200.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0200.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref3 = Database.database().reference().child("0300")
        ref3.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0300.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0300.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref4 = Database.database().reference().child("0400")
        ref4.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt < self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt > self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0400.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0400.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref5 = Database.database().reference().child("0500")
        ref5.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0500.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0500.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref6 = Database.database().reference().child("0600")
        ref6.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0600.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0600.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref7 = Database.database().reference().child("0700")
        ref7.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0700.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0700.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref8 = Database.database().reference().child("0800")
        ref8.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0800.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0800.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref9 = Database.database().reference().child("0900")
        ref9.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time0900.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time0900.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref10 = Database.database().reference().child("1000")
        ref10.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1000.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1000.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref11 = Database.database().reference().child("1100")
        ref11.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1100.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1100.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref12 = Database.database().reference().child("1200")
        ref12.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1200.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1200.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref13 = Database.database().reference().child("1300")
        ref13.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1300.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1300.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref14 = Database.database().reference().child("1400")
        ref14.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1400.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1400.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref15 = Database.database().reference().child("1500")
        ref15.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1500.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1500.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref16 = Database.database().reference().child("1600")
        ref16.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1600.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1600.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref17 = Database.database().reference().child("1700")
        ref17.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1700.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1700.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref18 = Database.database().reference().child("1800")
        ref18.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1800.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1800.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref19 = Database.database().reference().child("1900")
        ref19.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time1900.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time1900.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref20 = Database.database().reference().child("2000")
        ref20.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time2000.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time2000.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref21 = Database.database().reference().child("2100")
        ref21.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time2100.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time2100.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref22 = Database.database().reference().child("2200")
        ref22.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time2200.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time2200.backgroundColor = UIColor.lowTempPulsating
            }
        })
        let ref23 = Database.database().reference().child("2300")
        ref23.observe(.value, with: { snapshot in
            let test = snapshot.value
            self.tempString = "\(test!)°"
            let tempInt: Int  = (self.tempString as NSString).integerValue
            if(tempInt > self.DayHigh) {
                self.DayHigh = tempInt
            }
            if(tempInt < self.DayLow){
                self.DayLow = tempInt
            }
            if(tempInt > self.maxTemp){
                self.time2300.backgroundColor = UIColor.highTempPulsating
            } else {
                self.time2300.backgroundColor = UIColor.lowTempPulsating
            }
        })
        
        self.Info.text = "Highest Temp Today: \(self.DayHigh)"
        print(self.DayHigh)
        Info.frame = CGRect(x: 0, y: 40, width: screenSize.width, height: 100)
        
        self.Info2.text = "Lowest Temp Today: \(self.DayLow)"
        print(self.DayLow)
        Info2.frame = CGRect(x: 0, y: 60, width: screenSize.width, height: 100)
        
        if(self.DayHigh < maxTemp) {
            Info.textColor = UIColor.lowTempPulsating
        } else {
            Info.textColor = UIColor.highTempPulsating
        }
        
        if(self.DayLow < maxTemp){
        Info2.textColor = UIColor.lowTempPulsating
        } else {
        Info2.textColor = UIColor.highTempPulsating
        }
        /*view.addSubview(Info2)
        view.addSubview(Info)
 */

    }
}
