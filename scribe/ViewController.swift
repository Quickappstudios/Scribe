//
//  ViewController.swift
//  scribe
//
//  Created by QUICK APPS STUDIOS on 03/10/2016.
//  Copyright © 2016 QUICK APPS STUDIOS. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
    
    
    
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    
    @IBOutlet weak var transcribeTextField: UITextView!
    
    //create audioplayer object
    
    var audioPlayer:AVAudioPlayer!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      activitySpinner.isHidden = true
        
        
        
    }
    
    
    
    //stops spinner and audio
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        
        activitySpinner.stopAnimating()
        activitySpinner.isHidden = true
    }
    
    
    
    
    
    func requestSpeechAuth() {
        
        
        SFSpeechRecognizer.requestAuthorization{ authStatus in
        
        //speech recognizer can analyse
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized{
                
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a"){
                
                do{
                    
                    let sound = try AVAudioPlayer(contentsOf: path)
                    self.audioPlayer = sound
                    self.audioPlayer.delegate = self
                    sound.play()
                    
                }catch{
                    
                    print("Error")
                }
                    
                    
               let recoginizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    
                    recoginizer?.recognitionTask(with: request) { (result,error) in
                        
                        if let error = error{
                            
                       print("There is an error")
                            
                        }else{
                            
                            
                            
                            //transcribe our text
                            self.transcribeTextField.text =  result?.bestTranscription.formattedString
                            
                            //print(result?.bestTranscription.formattedString)
                        }
                            
                            
                            
                            
                            
                        }
                    
                   
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
            }
        }
        
        
    }
    
    
    
    @IBAction func playbuttonPressed(_ sender: AnyObject) {
        
       activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        
        requestSpeechAuth()
        
        
        
        
        
        
    }
    

}

