//
//  ViewController.swift
//  baladiyati2
//
//  Created by Mac-Mini-2021 on 08/11/2021.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.backgroundColor = .secondarySystemBackground
        
        button.backgroundColor = .systemBlue
        button.setTitle("Take picture", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
    }
    
    @IBAction func didTapButton(){
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
}
extension ViewController: UIImagePickerControllerDelegate,
           UINavigationBarDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as?
        UIImage else{
            return
        }
        imageView.image = image
    }
    
}

