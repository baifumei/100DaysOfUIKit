//
//  ViewController.swift
//  Project10
//
//  Created by Екатерина К on 29.12.2023.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))

    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
            fatalError("Unable to dequeue PersonCell")
        }
        let person = people[indexPath.item]
        cell.name.text = person.name
        
        let path = getDocumentDerectory().appendingPathComponent(person.image)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    @objc func addNewPerson() {
        let ac = UIAlertController(title: "Add a photo", message: nil, preferredStyle: .alert)
        let picker = UIImagePickerController()
        
        ac.addAction(UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
            picker.sourceType = .camera
            self?.present(picker, animated: true)
        })
        ac.addAction(UIAlertAction(title: "Media", style: .default) { [weak self] _ in
            picker.allowsEditing = true
            picker.delegate = self
            self?.present(picker, animated: true)
        })
        present(ac, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentDerectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        collectionView.reloadData()
        
        dismiss(animated: true)
    }
    
    func getDocumentDerectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    //MARK: - Rename/delete
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        
        let ac = UIAlertController(title: "Rename or delete person", message: nil, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Rename", style: .default) { [weak self] _ in
            let acRename = UIAlertController(title: "Rename person",  message: nil, preferredStyle: .alert)
            acRename.addTextField()
            
            acRename.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            acRename.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak acRename] _ in
                guard let newName = acRename?.textFields?[0].text else { return }
                person.name = newName
                self?.collectionView.reloadData()
            })
            self?.present(acRename, animated: true)
        })
        
        ac.addAction(UIAlertAction(title: "Delete", style: .default) { [weak self] _ in
            self?.people.remove(at: indexPath.item)
            try! FileManager.default.removeItem(at: (self?.getDocumentDerectory().appendingPathComponent(person.image))!)
            self?.collectionView.reloadData()
        })
        
        present(ac, animated: true)
    }
    
    func save() {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: people, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        }
    }
}

