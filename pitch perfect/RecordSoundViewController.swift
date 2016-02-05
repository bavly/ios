//
//  RecordSoundViewController.swift
//  pitch perfect
//
//  Created by bavly morcos on 11/17/15.
//  Copyright © 2015 udacity. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundViewController: UIViewController {

    //IB variable is variable connected to the story board
    //week manage memory to our variables 
    
    //! the variable be signed (value) is optional to assigned
    
    //outlet from a controller to the view 
    // action from a view to controlller
    //Declared Globally
    var audioRecorder:AVAudioRecorder!

    
   @IBOutlet weak var microphone: UIButton!
    
    @IBOutlet weak var recordinginprogress: UILabel!
    @IBOutlet weak var stopbutton: UIButton!

    //control or mange certain events on our app
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
// receive memory warning 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewWillAppear(animated: Bool) {
        
     microphone.enabled = true
        //hide the stop button
    stopbutton.hidden = true
    }
    
    
     
    
    @IBAction func recordaudio(sender: UIButton) {
       
        microphone.enabled = false

        stopbutton.hidden = false
        
        recordinginprogress.hidden=false
        //TODO::actually record the user voice
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        print("in record")
    }
    
    @IBAction func stopaction(sender: UIButton) {
        
    recordinginprogress.hidden = true
        //stopbutton.hidden = true
        microphone.hidden=true
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }

}

