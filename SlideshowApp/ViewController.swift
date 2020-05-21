//
//  ViewController.swift
//  SlideshowApp
//
//  Created by tomakazuki on 2020/05/18.
//  Copyright © 2020 tomakazuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var moveOnButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    var omikuji = 0
    var omikujiArray = [UIImage(named: "omikuji-daikichi")!, UIImage(named: "omikuji-kichi")!, UIImage(named: "omikuji-kyo")!]
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = omikujiArray[omikuji]
        imageView.image = image
    }
    
    @IBAction func moveOnButton(_ sender: UIButton) {
        if omikuji == 2 {
           omikuji = 0
        }else {
            omikuji += 1
        }
        imageView.image = omikujiArray[omikuji]
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        if omikuji == 0 {
            omikuji = 2
        } else {
            omikuji -= 1
        }
        imageView.image = omikujiArray[omikuji]
    }
    
    @IBAction func timer(_ sender: UIButton) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            let button = sender
            button.setTitle("停止", for: .normal)
            moveOnButton.isEnabled = false
            backButton.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer = nil
            let button = sender
            button.setTitle("再生", for: .normal)
            moveOnButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        if omikuji == 2 {
            omikuji = 0
        } else {
            self.omikuji += 1
        }
        imageView.image = omikujiArray[omikuji]
    }
    
    @IBAction func tapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "ExpansionViewController", sender: nil)
    }
    
    override func prepare( for segue: UIStoryboardSegue, sender: Any?) {
        let ExpansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        ExpansionViewController.bigImageView = omikujiArray[omikuji]
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            self.startButton.setTitle("再生", for: .normal)
            backButton.isEnabled = true
            moveOnButton.isEnabled = true
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
