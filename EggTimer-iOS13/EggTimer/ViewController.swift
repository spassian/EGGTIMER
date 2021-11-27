
import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var doneView: UILabel!
    let eggtimes = ["Soft":360,"Medium":420,"Hard":720]
   
    var secondPassed = 1
    var totalseconds=0
    
    var timer = Timer()
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        let hardness=sender.currentTitle!
        doneView.text = hardness
        progressView.progress=0.0
        totalseconds=0
        timer.invalidate()
        
        totalseconds = eggtimes[hardness]!
        

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
       
    }
    @objc func updateTimer()
    {
    if secondPassed<=totalseconds
    {
        let NoobPercent = (Float(secondPassed)/Float(totalseconds))
        progressView.progress = Float(NoobPercent)

        
        secondPassed+=1
    }
    else{
        timer.invalidate()
        playSound()
        doneView.text = "DONE!"
        secondPassed=0
    }
        
    }
    func playSound() {
           let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
       
    }

    
    
}
