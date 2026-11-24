//
//  ViewController.swift
//  Protocol.HomeWork
//
//  Created by Садыбек Мырзалиев on 23.11.2026.
//

import UIKit

protocol AddItemDelegate: AnyObject {
    func didAddItem(text: String)
    
}

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var viewController: UIView!
    
    weak var delegate: AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewController.layer.cornerRadius = 20
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        
        tap.delegate = self
        
        view.addGestureRecognizer(tap)
        
    }
    
    
    @IBAction func addInTableViewButton(_ sender: Any) {
        
        
        guard let text = textField.text else {return}
        
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedText.isEmpty{
            return
        }
        
        delegate?.didAddItem(text: trimmedText)
        
        dismiss(animated: true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: viewController))! {
            return false
        } else {
            return true
        }
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
        
        
    }
    
    
    
    
    
}

