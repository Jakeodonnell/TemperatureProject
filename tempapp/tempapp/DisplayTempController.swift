//
//  DisplayTempController.swift
//  tempapp
//
//  Created by Jake O´Donnell on 2019-01-03.
//  Copyright © 2019 Jake O´Donnell. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DisplayTempController: UIViewController{

    @IBOutlet weak var x: UIView!
    @IBOutlet weak var w: UIView!
    @IBOutlet weak var v: UIView!
    @IBOutlet weak var u: UIView!
    @IBOutlet weak var t: UIView!
    @IBOutlet weak var s: UIView!
    @IBOutlet weak var r: UIView!
    @IBOutlet weak var q: UIView!
    @IBOutlet weak var p: UIView!
    @IBOutlet weak var o: UIView!
    @IBOutlet weak var n: UIView!
    @IBOutlet weak var m: UIView!
    @IBOutlet weak var l: UIView!
    @IBOutlet weak var k: UIView!
    @IBOutlet weak var j: UIView!
    @IBOutlet weak var i: UIView!
    @IBOutlet weak var h: UIView!
    @IBOutlet weak var g: UIView!
    @IBOutlet weak var f: UIView!
    @IBOutlet weak var e: UIView!
    @IBOutlet weak var c: UIView!
    @IBOutlet weak var d: UIView!
    @IBOutlet weak var b: UIView!
    @IBOutlet weak var a: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tempView: UIView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let tempCellsOBJ = [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x]
        let tempCellsNAME = ["a", "b", "c", "d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x"]
        let tempCellsTIME = ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]

        for _ in tempCellsOBJ{
            //Check overflow of arraycounter
            self.count = self.count % 25
            //gets the reffrense to name of Collorcell in OBJ array
            let name = tempCellsOBJ[self.count]!
            //Tempstring used for conversion of database value
            //MaxTemp used for setting color and maxval for accepted temperature
            let maxTemp: Int = 0
            //sets reference to the chose child in database, tempCellsName with refferenc to index set by counter
            let ref = Database.database().reference().child("\(tempCellsNAME[count])")
            //incremetn counter so alla objects are checked
            self.count += 1
            //smooth edges
            name.layer.cornerRadius = 10
                //observe the reference is used to listen to any changes done in the database the copys its value
                ref.observe(.value, with: { snapshot in
                //Converts the value "snapshotted" to an integervalue of a string
                let tempInt: Int  = ("\(snapshot.value!)°" as NSString).integerValue
                //Checks if the temp is ok or too high
                if(tempInt > maxTemp){
                    name.backgroundColor = UIColor.highTempPulsatingInner
                } else {
                    name.backgroundColor = UIColor.lowTempPulsatingInner
                }

            })
            
        }
        //set view background
        view.backgroundColor = UIColor.backgroundColor
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
