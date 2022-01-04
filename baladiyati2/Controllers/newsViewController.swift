//
//  newsViewController.swift
//  baladiyati2
//
//  Created by Mac-Mini-2021 on 27/11/2021.
//

import UIKit
import Alamofire

class newsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var films = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.viewWithTag(0)
        let label = contentView?.viewWithTag(1) as! UILabel
        let image = contentView?.viewWithTag(2) as! UIImageView
        label.text = films[indexPath.row]
        image.image = UIImage(named: films[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = films[indexPath.row]
        performSegue(withIdentifier: "mSegue", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mSegue" {
            let movie = sender as! String
            let destination = segue.destination as! DetailsViewController
            destination.movieTitle = movie
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        struct Film: Codable {
            let id: Int
            let name: String
        }
        
        let url = "http://localhost:3000/getAll"
        
        Alamofire.request(url, method: .get).responseJSON { response in
            guard let itemsData = response.data else {
                print("GET error")
                return
            }
            do {
                let decoder = JSONDecoder()
                let items = try decoder.decode([Film].self, from: itemsData)
                for i in items{
                    self.films.append(i.name)
                }
                print(self.films)
                self.tableView.reloadData()
            } catch {
                print("Parsing error")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Warning", message: "Would you like to delete movie ?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let yesAction = UIAlertAction(title: "DELETE", style: .destructive, handler: {_ in
                let movieName = self.films[indexPath.row]
                self.deleteItem(name: movieName)
                self.films.remove(at: indexPath.row)
                tableView.reloadData()
            })
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            
        }
    }
    
    func deleteItem(name: String) {
        let url = "http://localhost:3000/remove"
        
        let params: Parameters = [
            "name": name
        ]
        
        Alamofire.request(url, method: .get,parameters: params)
            .validate()
            .responseJSON { response in
                switch response.result {
                    case .success:
                        print("Deleted Successfully")
                    case .failure(let error):
                        print(error)
                }
            }
        
    }
    
    /*func initMovies() {
        let films = ["El Camino","Extraction","Project Power","Six Underground","Spenser Confidential","The Irishman"]
        
        for i in films {
            addMovie(name: i)
        }
    }*/
    
}


