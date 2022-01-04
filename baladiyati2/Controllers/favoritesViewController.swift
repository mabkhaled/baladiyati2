//
//  favoritesViewController.swift
//  baladiyati2
//
//  Created by Mac-Mini-2021 on 27/11/2021.
//

import UIKit
import CoreData

class favoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var favorites = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.viewWithTag(0)
        let label = contentView?.viewWithTag(1) as! UILabel
        let image = contentView?.viewWithTag(2) as! UIImageView
        label.text = favorites[indexPath.row]
        image.image = UIImage(named: favorites[indexPath.row])
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        let reqeust = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        do {
            
            let result = try managedContext.fetch(reqeust)
            for item in result {
                favorites.append(item.value(forKey: "movieName") as! String)
            }
            
        } catch {
            let alert = UIAlertController(title: "FETCH", message: "FETCHING ERROR", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .destructive)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Warning", message: "Would you like to delete movie ?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let yesAction = UIAlertAction(title: "DELETE", style: .destructive, handler: {_ in
                self.deleteItem(index: indexPath.row)
                self.favorites.remove(at: indexPath.row)
                tableView.reloadData()
            })
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            
        }
    }
    
    func deleteItem(index: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject >(entityName: "Movie")
        let predicate = NSPredicate(format: "movieName = %@", favorites[index]) //%d pour int
        request.predicate = predicate
        
        do {
            let result = try managedContext.fetch(request)
            if result.count > 0{
                let obj = result[0]
                managedContext.delete(obj)
                
                print("DELETED SUCCESSFULLY")
            }
        } catch {
            print("DELETING ERROR")
        }
        
    }

}
