//
//  ViewController.swift
//  Egg Timer
//
//  Created by Muhamed Alkhatib on 21/08/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
    }
    var counter = 3
    var secondsPassed = 0
    var timer = Timer()
    
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var imgvEgg: UIImageView!
    @IBAction func cookingSegmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            imgvEgg.image = #imageLiteral(resourceName: "Soft");counter = 3
        case 1:imgvEgg.image = UIImage(named:"Medium" );counter = 5
        case 2 : imgvEgg.image = UIImage(named: "hard");counter = 8
        default:
            print("error")
        }
        progressBar.progress = 0.0
        print(counter)
    }
    
    @IBAction func btnStartPressed(_ sender: UIButton) {
        lblTitle.text = "Process is going"
        timer.invalidate()
        secondsPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer) , userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < counter {
            print(secondsPassed)
            secondsPassed += 1
            let percentageProgress = Float (secondsPassed) / Float (counter)
            progressBar.progress = percentageProgress
        }
        else{
            timer.invalidate()
            lblTitle.text = "Done"
        }
    }
    
    @IBOutlet var progressBar: UIProgressView!
    
}

