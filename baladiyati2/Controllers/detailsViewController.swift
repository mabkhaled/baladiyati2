//
//  detailsViewController.swift
//  baladiyati2
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit
import CoreData
import Alamofire

class DetailsViewController: UIViewController {

    var movieTitle:String?
    @IBOutlet weak var movieLabel: UILabel!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieLabel.text = movieTitle!
        movieImage.image = UIImage(named: movieTitle!)
    }
    
    func insertItem() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext //[NSManagedObject]
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)
        let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
        
        object.setValue(movieTitle!, forKey: "movieName")
        
        do {
            try managedContext.save()
            let alert = UIAlertController(title: "INSERT", message: "INSERT SUCCESSFULLY !", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true)
        } catch {
            let alert = UIAlertController(title: "INSERT", message: "INSERT ERROR", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .destructive)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        
    }
    
    func checkMovie() -> Bool {
        
        var movieExist = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject >(entityName: "Movie")
        let predicate = NSPredicate(format: "movieName = %@", movieTitle!) //%d pour int
        request.predicate = predicate
        
        do {
            let resul = try managedContext.fetch(request)
            if resul.count > 0 {
                movieExist = true
            }
            
        } catch {
            print("FETCHING ERROR")
        }
        
        return movieExist
    }
    
    @IBAction func saveMovie(_ sender: Any) {
        if !checkMovie() {
            insertItem()
        }else{
            let alert = UIAlertController(title: "Warning", message: "Movie already exist in favorites", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    
    
    
}
