//
//  ViewController.swift
//  Project13
//
//  Created by Екатерина К on 1/29/24.
//

import CoreImage
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet var intensity: UISlider!
    @IBOutlet var imageView: UIImageView!
    
    var currentImage: UIImage!
    var context: CIContext!
    var currentFilter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Yet Another Core Image Filters Program - YACIFP
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    @IBAction func changeFilter(_ sender: Any) {
    }
    @IBAction func save(_ sender: Any) {
    }
    @IBAction func intensityChanged(_ sender: Any) {
        applyProcessing()
    }
    
    func applyProcessing() {
        guard let outputImage = currentFilter.outputImage else { return }
        currentFilter.setValue(intensity.value, forKey: kCIInputIntensityKey)
        
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgImage)
            imageView.image = processedImage
        }
    }

}

