//
import UIKit

class GameViewController: UIViewController {
    
    var model: gameModule?
    var timerFunc = Timer()
    
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var goToLoseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupTimer()
    }
    
    func updateUI() {
        wordLabel.text = model?.getRandomWord()
        termLabel.text = model?.getRandomTerm()
    }
    
    func setupTimer() {
        var timerCount = 60
        timerFunc = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            timerCount -= 1
            self.timer.text = "00:\(timerCount)"
            // end life time of timer after it equals 0
            if timerCount == 0 {
                timer.invalidate()
                performSegue(withIdentifier: "goToLose", sender: goToLoseButton)
            }
        }
    }
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        model?.increseScores()
        performSegue(withIdentifier: "goToWin", sender: sender)
    }
    
    @IBAction func breakRulesPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToLose", sender: sender)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWin"{
            guard let correctVC = segue.destination as? CorrectViewController else {return}
            correctVC.model = model
        } else if segue.identifier == "goToLose" {
            guard let wrongVC = segue.destination as? WrongViewController else {return}
            wrongVC.model = model
        }
    }
    
}
