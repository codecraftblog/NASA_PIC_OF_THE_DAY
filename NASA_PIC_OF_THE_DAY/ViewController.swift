//
//  ViewController.swift
//  NASA_PIC_OF_THE_DAY
//
//  Created by Moorthy, Prashanth on 20/03/20.
//  Copyright © 2020 Code Craft Blog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postImageView : UIImageView!
    @IBOutlet weak var postTitleLabel : UILabel!
    @IBOutlet weak var postExplanationTextView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // NASA APOD api. Please ensure you get an API KEY from the APOD site and  replace "DEMO_KEY" with your key.
        let apodURLString = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
        let finalApodURL = URL(string: apodURLString)!
        
        let fetchedData = try! Data(contentsOf: finalApodURL)
        let fetchedJSON = try! JSONSerialization.jsonObject(with: fetchedData, options: []) as! [String : String]
        print(fetchedJSON)
        
        // Create an instance of Post
        let fetchedPost = Post(apodJSON: fetchedJSON)
        print(fetchedPost)
        

        postImageView.image = fetchedPost.lowResImage
        postImageView.contentMode = .scaleToFill
        
        postTitleLabel.text = fetchedPost.title
        postExplanationTextView.text = fetchedPost.description
    }


}

