//
//  ViewController.swift
//  Calculator
//
//  Created by Phạm Huy on 5/14/19.
//  Copyright © 2019 Phạm Huy. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var Ac_Outlet: UIButton!
    @IBOutlet weak var Du_Outlet: UIButton!
    @IBOutlet weak var phanTram_Outlet: UIButton!
    @IBOutlet weak var chia_Outlet: UIButton!
    @IBOutlet weak var nhan_Outlet: UIButton!
    @IBOutlet weak var tru_Outlet: UIButton!
    @IBOutlet weak var cong_Outlet: UIButton!
    @IBOutlet weak var bang_Outlet: UIButton!
    @IBOutlet weak var phay_Outlet: UIButton!
    @IBOutlet weak var Ko_Outlet: UIButton!
    @IBOutlet weak var mot_Outlet: UIButton!
    @IBOutlet weak var hai_Outlet: UIButton!
    @IBOutlet weak var ba_Outlet: UIButton!
    @IBOutlet weak var bon_Outlet: UIButton!
    @IBOutlet weak var nam_Outlet: UIButton!
    @IBOutlet weak var sau_Outlet: UIButton!
    @IBOutlet weak var bay_Outlet: UIButton!
    @IBOutlet weak var tam_Outlet: UIButton!
    @IBOutlet weak var chin_Outlet: UIButton!

    var Result_Lbl = UILabel()
    var numberNext : Double = 0
    var numberPre : Double = 0
    var KH = 0
    var performingOperation = false
    


    override func viewDidLoad() {
        //customs button
        Ac_Outlet.layer.cornerRadius = 25
        Du_Outlet.layer.cornerRadius = 25
        phanTram_Outlet.layer.cornerRadius = 25
        chia_Outlet.layer.cornerRadius = 25
        nhan_Outlet.layer.cornerRadius = 25
        tru_Outlet.layer.cornerRadius = 25
        cong_Outlet.layer.cornerRadius = 25
        bang_Outlet.layer.cornerRadius = 25
        phay_Outlet.layer.cornerRadius = 25
        Ko_Outlet.layer.cornerRadius = 25
        mot_Outlet.layer.cornerRadius = 25
        hai_Outlet.layer.cornerRadius = 25
        ba_Outlet.layer.cornerRadius = 25
        bon_Outlet.layer.cornerRadius = 25
        nam_Outlet.layer.cornerRadius = 25
        sau_Outlet.layer.cornerRadius = 25
        bay_Outlet.layer.cornerRadius = 25
        tam_Outlet.layer.cornerRadius = 25
        chin_Outlet.layer.cornerRadius = 25
        // custom boder
        Ac_Outlet.layer.borderWidth = 1
        Du_Outlet.layer.borderWidth = 1
        phanTram_Outlet.layer.borderWidth = 1
        chia_Outlet.layer.borderWidth = 1
        nhan_Outlet.layer.borderWidth = 1
        tru_Outlet.layer.borderWidth = 1
        cong_Outlet.layer.borderWidth = 1
        bang_Outlet.layer.borderWidth = 1
        phay_Outlet.layer.borderWidth = 1
        Ko_Outlet.layer.borderWidth = 1
        mot_Outlet.layer.borderWidth = 1
        hai_Outlet.layer.borderWidth = 1
        ba_Outlet.layer.borderWidth = 1
        bon_Outlet.layer.borderWidth = 1
        nam_Outlet.layer.borderWidth = 1
        sau_Outlet.layer.borderWidth = 1
        bay_Outlet.layer.borderWidth = 1
        tam_Outlet.layer.borderWidth = 1
        chin_Outlet.layer.borderWidth = 1
        // create UILable
        //Result_Lbl.backgroundColor = .red
        Result_Lbl.textColor = .white
        Result_Lbl.textAlignment = .right
        Result_Lbl.font = Result_Lbl.font.withSize(50)
        Result_Lbl.text = ""
        view.addSubview(Result_Lbl)
        let top = NSLayoutConstraint(item: Result_Lbl, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 20)
        let leading1 = NSLayoutConstraint(item: Result_Lbl, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: Result_Lbl, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: Result_Lbl, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1/4, constant: 0)
        Result_Lbl.autoresizesSubviews = false
        view.addConstraints([top, leading1, width, height])
        Result_Lbl.translatesAutoresizingMaskIntoConstraints = false



        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func Button_Press(_ sender: Any) {
        Ac_Outlet.setTitle("C", for: .normal)
        let tag = (sender as! UIButton).tag
        if performingOperation == true{
            if Result_Lbl.text == "-" || Result_Lbl.text == "+" || Result_Lbl.text == "x" || Result_Lbl.text == "/"
            {
                Result_Lbl.text = ""
            }
            Result_Lbl.text = Result_Lbl.text! + String(tag - 1)
            numberNext = Double(Result_Lbl.text!)!
            print("Số sau: ", self.numberNext)
        }
        else{
            if Result_Lbl.text == nil{
                Result_Lbl.text = String(tag - 1)
                numberPre = Double(Result_Lbl.text!)!
            }
            Result_Lbl.text = Result_Lbl.text! + String(tag - 1)
            numberPre = Double(Result_Lbl.text!)!
            print("Số trk: ", self.numberPre)
        }
    }


    @IBAction func Operation(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        // press AC btn
        if tag == 12 {
            Ac_Outlet.setTitle("AC", for: .normal)
            Result_Lbl.text = ""
            numberPre = 0
            numberNext = 0
            KH = 0
            performingOperation = false
            return
        }
        // +()
        if tag == 18{
            performingOperation = true
            Result_Lbl.text = "+"
          //  numberPre = numberPre + numberNext
            KH = tag
        }
        // -()
        else if tag == 17{
            performingOperation = true
            Result_Lbl.text = "-"
           // numberPre = numberPre - numberNext
            KH = tag
        }
        // x()
        else if tag == 16{
            performingOperation = true
            Result_Lbl.text = "x"
           // numberPre = numberPre * numberNext
            KH = tag
        }
        // +/_()
        else if tag == 13 {
            numberPre = -numberPre
            Result_Lbl.text = String(numberPre)
        }

        // %()

        else if tag == 14 {
            numberPre = numberPre / 100
            Result_Lbl.text = String(numberPre)
        }
        // /()
        else if tag == 15{
            performingOperation = true
            Result_Lbl.text = "/"
            //numberPre = numberPre / numberNext
            KH = tag
        }
        // .()
        else if tag == 11 {
            Result_Lbl.text = Result_Lbl.text! + "."
        }
        // =()
        else if tag == 19{
            if KH == 18{
                Result_Lbl.text = String(numberPre + numberNext)
            }
            else if KH == 17{
                Result_Lbl.text = String(numberPre - numberNext)
            }
            else if KH == 16{
                Result_Lbl.text = String(numberPre * numberNext)
            }
            else if KH == 15{
                Result_Lbl.text = String(numberPre / numberNext)
            }
        }
   }

}

