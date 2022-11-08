
import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    
    var recivedCharacter : Result?
    var labelCharacter  : [String:String] = [
        "n"  : "Name: ",
        "st" : "Status: ",
        "sp" : "Species: ",
        "t"  : "Type: ",
        "g"  : "Gender: "
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Obtencion de la imagen del personaje
        if let posterUrl = URL(string: recivedCharacter!.image) {
            URLSession.shared.dataTask(with: posterUrl) { (data, urlResponse, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.characterImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        
        // Visualizacion de los atributos del personaje
        nameLabel.text    = labelCharacter["n"]!  + recivedCharacter!.name
        statusLabel.text  = labelCharacter["st"]! + recivedCharacter!.status.rawValue
        speciesLabel.text = labelCharacter["sp"]! + recivedCharacter!.species.rawValue
        typeLabel.text    = labelCharacter["t"]!  + recivedCharacter!.type
        genreLabel.text   = labelCharacter["g"]!  + recivedCharacter!.gender.rawValue
    }
    
    

}
