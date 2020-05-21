//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by tomakazuki on 2020/05/20.
//  Copyright © 2020 tomakazuki. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var bigImageView: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = bigImageView
        
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
