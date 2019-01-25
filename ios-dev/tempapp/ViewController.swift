//
//  ViewController.swift
//  TempSensor
//
//  Created by Jake O´Donnell on 2018-11-25.
//  Copyright © 2018 Jake O´Donnell. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet var ButtonToGraph: UIButton!
    var tempString: String = ""
    var maxTemp: Int = 0
   
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
 
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @objc func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleEnterForeground), name:UIApplication.willEnterForegroundNotification, object: nil)
        
    }
    
    @objc public func handleEnterForeground() {
        animatePulsatingLayer()
    }

    var pulsatingLayer: CAShapeLayer!
    let trackLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

       /* view.addSubview(GraphButton)
   */
        
        setupNotificationObservers()
        let content = UNMutableNotificationContent()
        content.title = "High Temperature"
        content.body = "Temperature is now over \(maxTemp)"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "HIGHTEMP", content: content, trigger: trigger)
        
        view.backgroundColor = UIColor.backgroundColor
        
        super.viewDidLoad()
        var setTemp: Bool = true
        let ref = Database.database().reference().child("logs")
            ref.observe(.value, with: { snapshot in
                let hour = Calendar.current.component(.hour, from: Date())
                print(hour)
                //Getting value and setting string of temp in the middle of screen
                self.tempString = "\(snapshot.value!)°"
                self.tempLabel.text = self.tempString
                
                let tempInt: Int  = (self.tempString as NSString).integerValue
                print("INT PARSE", tempInt)
                if(tempInt > self.maxTemp){
                    if(setTemp == true){
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                        setTemp = false
                    }
                    print("HIGH")
                    self.pulsatingLayer.fillColor = UIColor.highTempPulsating.cgColor
                    self.trackLayer.strokeColor = UIColor.highTempPulsatingInner.cgColor

                } else {
                    setTemp = true
                    self.pulsatingLayer.fillColor = UIColor.lowTempPulsating.cgColor
                    self.trackLayer.strokeColor = UIColor.lowTempPulsatingInner.cgColor
                }
                
            })
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circularPath.cgPath
        pulsatingLayer.strokeColor = UIColor.clear.cgColor
        pulsatingLayer.lineWidth = 10
        pulsatingLayer.fillColor = UIColor.lowTempPulsating.cgColor
        pulsatingLayer.lineCap = CAShapeLayerLineCap.round
        pulsatingLayer.position = view.center
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lowTempPulsatingInner.cgColor
        trackLayer.lineWidth = 20
        trackLayer.fillColor = UIColor.backgroundColor.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.position = view.center

       
        animatePulsatingLayer()
        tempLabel.frame = CGRect(x: 0, y: 0, width: 70, height: 100)
        tempLabel.center = view.center
        
        view.layer.addSublayer(pulsatingLayer)
        view.layer.addSublayer(trackLayer)
        view.addSubview(tempLabel)
        
    }
    
    func animatePulsatingLayer(){
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.3
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        pulsatingLayer.add(animation, forKey: "pulsing")
    }
}
