//
//  ViewController.swift
//  DigmonGuessNumber
//
//  Created by Yuan-Che Chang on 2020/9/6.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var crest1: UIImageView!
    @IBOutlet weak var crest6: UIImageView!
    @IBOutlet weak var crest4: UIImageView!
    @IBOutlet weak var crest3: UIImageView!
    @IBOutlet weak var crest2: UIImageView!
    @IBOutlet weak var crest5: UIImageView!
    @IBOutlet weak var RangeLabel: UILabel!
    @IBOutlet weak var successImageView: UIImageView!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var failImageView: UIImageView!
    
    @IBOutlet weak var originImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var dialogBoxImageView: UIImageView!
    
    
    @IBOutlet weak var Label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guessTextField.delegate = self
    }
    
    
    var answer = Int.random(in: 1...100)
    //答案設亂數
    
    var guesswrongcount = 6
    var upperBound = 100 //最大範圍提示
    var lowerBound = 0  //最小範圍提示
    
    
    func sent() {
       
        
        let numberText = guessTextField.text!
        let number = Int(numberText)
        if number != nil {
            let guessNumber = number!
            print(answer)
            if guessNumber == answer {
                
                resultLabel.text = "恭喜!進化成「機械暴龍獸」"
                resultLabel.isHidden = false
                successImageView.isHidden = false
                guessTextField.isHidden = true
                dialogBoxImageView.isHidden = true
                Label1.isHidden = true
                Label2.isHidden = true
                Label3.isHidden = true
                failImageView.isHidden = true
                RangeLabel.isHidden = true
                originImageView.isHidden = true
                
            }else if guessNumber < answer{
                guesswrongcount  = guesswrongcount - 1
                guessTextField.text = ""
                
                
            }else if guessNumber > answer{
                guesswrongcount  = guesswrongcount - 1
                guessTextField.text = ""
                
            }
            
            if guesswrongcount == 0 {
                resultLabel.isHidden = false
                resultLabel.text = "失敗！進化成「喪失暴龍獸」"
                failImageView.isHidden = false
                
                successImageView.isHidden = true
                originImageView.isHidden = true
                Label1.isHidden = true
                Label2.isHidden = true
                Label3.isHidden = true
                guessTextField.isHidden = true
                dialogBoxImageView.isHidden = true
                RangeLabel.isHidden = true
                
                
            }
            
            
            
            ranger(guess: guessNumber)
            
            
            
            switch Int(guesswrongcount) {
            case 5:
                crest6.isHidden = true
            case 4:
                crest5.isHidden = true
            case 3:
                crest4.isHidden = true
            case 2:
                crest3.isHidden = true
            case 1:
                crest2.isHidden = true
            case 0:
                crest1.isHidden = true
            default:
                break
            }
            
            
            
            
            view.endEditing(true)
        }
        
        
    }
    
    
    
    //按按鈕收鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        guessTextField.resignFirstResponder()
        return true
    }
   
    //提示玩家最近的範圍
    func getBoundaryText() -> String {
        return "(\(lowerBound)~\(upperBound))"
    }
    
    
    
    
    func ranger(guess:Int){
        if guess > answer && guess < upperBound {
            upperBound = guess
            
            RangeLabel.text = "\(getBoundaryText())"
            
        }else if guess < answer && guess > lowerBound{
            lowerBound = guess
            
            RangeLabel.text = "\(getBoundaryText())"
//        }else {
//            RangeLabel.text = "Range"
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        sent()
       
        return true
    }
    
    @IBAction func playAgain(_ sender: Any) {
        guesswrongcount = 6
        upperBound = 100 //最大範圍提示
        lowerBound = 0  //最小範圍提示
        guessTextField.text = ""
        RangeLabel.text = "Range"
        answer = Int.random(in: 1...100)
        resultLabel.isHidden = true
        successImageView.isHidden = true
        guessTextField.isHidden = true
        dialogBoxImageView.isHidden = false
        Label1.isHidden = false
        Label2.isHidden = false
        Label3.isHidden = false
        failImageView.isHidden = true
        RangeLabel.isHidden = false
        crest1.isHidden = false
        crest2.isHidden = false
        crest3.isHidden = false
        crest4.isHidden = false
        crest5.isHidden = false
        crest6.isHidden = false
        originImageView.isHidden = false
        guessTextField.isHidden = false
        
    }
}
