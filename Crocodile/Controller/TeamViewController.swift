//
import UIKit

class TeamViewController: UIViewController {
    
    var model = gameModule()
    var team1: Team?
    var team2: Team?

    @IBOutlet weak var team2Image: UIImageView!
    @IBOutlet weak var team1Image: UIImageView!
    @IBOutlet weak var team2Label: UILabel!
    @IBOutlet weak var team1Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        model.team1 = team1
        model.team2 = team2
    }
    
    func updateUI() {
        team1 = model.getRandomTeam()
        team1?.yourTurn = true
        team2 = model.getRandomTeam()
        team1Image.image = UIImage(named: team1!.image)
        team1Label.text = team1?.teamName
        team2Image.image = UIImage(named: team2!.image)
        team2Label.text = team2?.teamName
    }
    
    
    @IBAction func platersReadyPressed(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTheme"{
            guard let categoryVC = segue.destination as? CategoryViewController else {return}
            categoryVC.model = model
        }
    }
}
