//
//  playsoundsViewController.swift
//  pitch perfect
//
//  Created by bavly morcos on 11/27/15.
//  Copyright © 2015 udacity. All rights reserved.
//

import UIKit
import AVFoundation

class playsoundsViewController: UIViewController {

    
     var audioPlayer = AVAudioPlayer!()
    override func viewDidLoad() {
        super.viewDidLoad()

        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        {
            
            let filepathURL = NSURL.fileURLWithPath(filePath)
        
            audioPlayer = try!
                AVAudioPlayer(contentsOfURL: filepathURL)
            audioPlayer.enableRate = true
            
            
            
           }
        else
        {
            print("the file path is empty ")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func slowmotion(sender: UIButton) {
        //slow motion
         audioPlayer.stop()
          audioPlayer.rate = 0.5 
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
      
        
    }
    
    
    @IBAction func fastmotion(sender: UIButton) {
         audioPlayer.stop()
        audioPlayer.rate = 1.5
        audioPlayer.currentTime = 0.0
         audioPlayer.play()
        
        
    }
    
    
    
    @IBAction func stopbuton(sender: UIButton) {
        audioPlayer.stop()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
