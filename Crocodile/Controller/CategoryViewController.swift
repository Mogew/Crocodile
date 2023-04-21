//
import UIKit

class CategoryViewController: UIViewController {
    
    var model: gameModule?
    var theme: Theme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startGamePressed(_ sender: UIButton) {
        if let themeWords = theme?.ThemeWords {
            model?.getWordsFromCategory(words: themeWords)
            performSegue(withIdentifier: "gameStart", sender: sender)
        }
    }
    
    
    @IBAction func theme1Pressed(_ sender: UIButton) {
        theme = model?.themes[0]
        sender.setTitle(theme?.ThemeName, for: .normal)
    }
    
    @IBAction func theme2Pressed(_ sender: UIButton) {
        theme = model?.themes[1]
        sender.setTitle(theme?.ThemeName, for: .normal)
    }
    
    
    @IBAction func theme3Pressed(_ sender: UIButton) {
        theme = model?.themes[2]
        sender.setTitle(theme?.ThemeName, for: .normal)
    }
    
    @IBAction func theme4Pressed(_ sender: UIButton) {
        theme = model?.themes[3]
        sender.setTitle(theme?.ThemeName, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameStart"{
            guard let gameVC = segue.destination as? GameViewController else {return}
            gameVC.model = model

        }
    }

}
