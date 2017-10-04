//=============
import UIKit
//=============
class ViewController: UIViewController {
    //---------------
    // Caches - la connexion des les "layers" avec le Main.storyboard - Gère le contenu pour une zone sur l'écran.
    @IBOutlet weak var back1: UIView!
    @IBOutlet weak var front1: UIView!
    @IBOutlet weak var back2: UIView!
    @IBOutlet weak var front2: UIView!
    @IBOutlet weak var back3: UIView!
    @IBOutlet weak var front3: UIView!
    @IBOutlet weak var back4: UIView!
    @IBOutlet weak var front4: UIView!
    @IBOutlet weak var back5: UIView!
    @IBOutlet weak var front5: UIView!
    @IBOutlet weak var back6: UIView!
    @IBOutlet weak var front6: UIView!
    @IBOutlet weak var back7: UIView!
    @IBOutlet weak var front7: UIView!
    @IBOutlet weak var back8: UIView!
    @IBOutlet weak var front8: UIView!
    // Images des animaux - la connexion des les images avec le Main.storyboard - Affiche d'images animées dans l'interface.
    @IBOutlet weak var animal1: UIImageView!
    @IBOutlet weak var animal2: UIImageView!
    @IBOutlet weak var animal3: UIImageView!
    @IBOutlet weak var animal4: UIImageView!
    @IBOutlet weak var animal5: UIImageView!
    @IBOutlet weak var animal6: UIImageView!
    @IBOutlet weak var animal7: UIImageView!
    @IBOutlet weak var animal8: UIImageView!
    // Cartes - la connexion des les cartes avec le Main.storyboard.
    @IBOutlet weak var card_1: UIView!
    @IBOutlet weak var card_2: UIView!
    @IBOutlet weak var card_3: UIView!
    @IBOutlet weak var card_4: UIView!
    @IBOutlet weak var card_5: UIView!
    @IBOutlet weak var card_6: UIView!
    @IBOutlet weak var card_7: UIView!
    @IBOutlet weak var card_8: UIView!
    // Bouton pour recommencer - la connexion des le bouton "Reset" avec le Main.storyboard - Exécute le code en réponse aux interactions de l'utilisateur.
    @IBOutlet weak var buttonReset: UIButton!
    // Variables des tableaux - la creation de les tableaux qui seront utilisé pendant l'utilisation de l'application
    var cards: [UIView]!
    var arrayOfAnimals: [UIImageView]!
    var arrayOfAnimalNames: [String] = ["elephant.png", // le tableau d'animaux
                                        "lion.png",
                                        "monkey.png",
                                        "tiger.png",
                                        "elephant.png",
                                        "lion.png",
                                        "monkey.png",
                                        "tiger.png"]
    var arrayOfRandomAnimalNames = [String]()
    var arrayChosenCards = [String]()
    var arrayChosenViews = [UIView]()
    
    var arrayOfShowingBacks = [UIView]()
    var arrayOfHidingFronts = [UIView]()
    var countCards = 0
    //--------------- Appelé après que la vue du contrôleur de vue a été chargée dans la mémoire.
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]
        arrayOfAnimals = [animal1, animal2, animal3, animal4, animal5, animal6, animal7, animal8]
        randomAnimalNames()
        setImagesToCard()
    }
    //--------------- Pour tourner les cartes d'avant en arriere - Expose le méthode comme un point de connexion entre les éléments de l'interface utilisateur et le code de l'application.
    @IBAction func showCard(_ sender: UIButton) {
        
        if arrayOfHidingFronts.count == 2 {
            return
        }
        switch sender.tag {
        case 0:
            flipCard(from: front1, to: back1)
            arrayChosenCards.append(arrayOfRandomAnimalNames[0])
            arrayChosenViews.append(card_1)
            arrayOfHidingFronts.append(front1)
            arrayOfShowingBacks.append(back1)
        case 1:
            flipCard(from: front2, to: back2)
            arrayChosenCards.append(arrayOfRandomAnimalNames[1])
            arrayChosenViews.append(card_2)
            arrayOfHidingFronts.append(front2)
            arrayOfShowingBacks.append(back2)
        case 2:
            flipCard(from: front3, to: back3)
            arrayChosenCards.append(arrayOfRandomAnimalNames[2])
            arrayChosenViews.append(card_3)
            arrayOfHidingFronts.append(front3)
            arrayOfShowingBacks.append(back3)
        case 3:
            flipCard(from: front4, to: back4)
            arrayChosenCards.append(arrayOfRandomAnimalNames[3])
            arrayChosenViews.append(card_4)
            arrayOfHidingFronts.append(front4)
            arrayOfShowingBacks.append(back4)
        case 4:
            flipCard(from: front5, to: back5)
            arrayChosenCards.append(arrayOfRandomAnimalNames[4])
            arrayChosenViews.append(card_5)
            arrayOfHidingFronts.append(front5)
            arrayOfShowingBacks.append(back5)
        case 5:
            flipCard(from: front6, to: back6)
            arrayChosenCards.append(arrayOfRandomAnimalNames[5])
            arrayChosenViews.append(card_6)
            arrayOfHidingFronts.append(front6)
            arrayOfShowingBacks.append(back6)
        case 6:
            flipCard(from: front7, to: back7)
            arrayChosenCards.append(arrayOfRandomAnimalNames[6])
            arrayChosenViews.append(card_7)
            arrayOfHidingFronts.append(front7)
            arrayOfShowingBacks.append(back7)
        case 7:
            flipCard(from: front8, to: back8)
            arrayChosenCards.append(arrayOfRandomAnimalNames[7])
            arrayChosenViews.append(card_8)
            arrayOfHidingFronts.append(front8)
            arrayOfShowingBacks.append(back8)
        default: break
        }
        verification() // appelle la fonction verification
    }
    //--------------- Pour faire le flip de la carte dans 1 seconde
    func flipCard(from: UIView, to: UIView) {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
            UIView.transition(with: from, duration: 1.0, options: transitionOptions, animations: {
                                from.isHidden = true
            })
            UIView.transition(with: to, duration: 1.0, options: transitionOptions,
                              animations: {
                                to.isHidden = false
            })
    }
    //--------------- Pour mettre les animaux dans les cartes
    func setImagesToCard() {
        var number = 0
        for animal in arrayOfAnimals {
            animal.image = UIImage(named: arrayOfRandomAnimalNames[number])
            number = number + 1
        }
    }
    //---------------
    func randomAnimalNames() {
        let numberOfAnimals = arrayOfAnimalNames.count
        
        for _ in 1...numberOfAnimals {
            let randomNumber = Int(arc4random_uniform(UInt32(arrayOfAnimalNames.count)))
            arrayOfRandomAnimalNames.append(arrayOfAnimalNames[randomNumber])
            arrayOfAnimalNames.remove(at: randomNumber)
        }
    }
    //--------------- Pour faire la verification de la quantite des cartes tapez - Crée une minuterie et l'organise sur la boucle d'exécution en mode par défaut.
    func verification() {
        if arrayChosenCards.count == 2 {
            if arrayChosenCards[0] == arrayChosenCards[1] {
                Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(hideCards)), userInfo: nil, repeats: false)
                        countCards += 1
                if countCards == 4 {
                    buttonReset.isHidden = false // Détermine la visibilité du le bouton Reset.
                }
            } else {
                arrayChosenViews = []
            }
            arrayChosenCards = []
        }
        resetCards() // appelle le fonction de resetCards
    }
    //--------------- Pour recommencer le jeu
    func resetCards() {
        if arrayOfShowingBacks.count == 2 {
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(reflip)), userInfo: nil, repeats: false)
        }
    }
    //--------------- Pour faire le "reflip"
    @objc func reflip() {
        for index in 0..<arrayOfShowingBacks.count {
            flipCard(from: arrayOfShowingBacks[index], to: arrayOfHidingFronts[index])
        }
        arrayOfHidingFronts = []
        arrayOfShowingBacks = []
    }
    //---------------
    @objc func hideCards() {
        arrayChosenViews[0].isHidden = true
        arrayChosenViews[1].isHidden = true
        arrayChosenViews = []
    }
    //--------------- La fonction pour le bouton Reset
    @IBAction func reset(_ sender: UIButton) {
        if arrayOfHidingFronts.count == 1 {
            flipCard(from: arrayOfShowingBacks[0], to: arrayOfHidingFronts[0])
            arrayOfShowingBacks = []
            arrayOfHidingFronts = []
        }
        
        countCards = 0
        buttonReset.isHidden = true
        
    for card in cards {
            card.isHidden = false
    }
        arrayOfAnimalNames = ["elephant.png",
                              "lion.png",
                              "monkey.png",
                              "tiger.png",
                              "elephant.png",
                              "lion.png",
                              "monkey.png",
                              "tiger.png"]
    arrayOfRandomAnimalNames = []
    randomAnimalNames()
    setImagesToCard()
    //---------------
    }
}
