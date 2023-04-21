import UIKit

class GameResultViewController: UIViewController {
    
    var model: gameModule?
    
    @IBOutlet weak var team2Image: UIImageView!
    @IBOutlet weak var team1Image: UIImageView!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var team1Scores: UILabel!
    @IBOutlet weak var team2Scores: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        team1Name.text = model?.team1?.teamName
        team1Scores.text = "\(model!.team1!.scores)"
        team1Image.image = UIImage(named: model!.team1!.image)
        team2Name.text = model?.team2?.teamName
        team2Scores.text = "\(model!.team2!.scores)"
        team2Image.image = UIImage(named: model!.team2!.image)
    }
}
