
import UIKit

class TableViewController: UITableViewController {
    
    var characters = [Result]()
    var selectedCharacter : Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url=URL(string: "https://rickandmortyapi.com/api/character/") {
            do {
                let bytes = try Data(contentsOf: url)
                let rick = try JSONDecoder().decode(Rick.self, from: bytes)
                characters = rick.results
            }
            catch {
                
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        selectedCharacter = characters[indexPath.row]
        cell.textLabel?.text = selectedCharacter!.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCharacter = characters[indexPath.row]
        self.performSegue(withIdentifier: "goToDetails", sender: Self.self)
    }
    
    // Se envia el personaje al DetailsViewController para mostrarse en su vista
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailsViewController
        destination.recivedCharacter = selectedCharacter
    }

}
