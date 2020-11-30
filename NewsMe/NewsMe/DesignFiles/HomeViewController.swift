//
//  HomeViewController.swift
//  NewsMe
//
//  Created by Shivam on 30/11/20.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
   
    var selectedCountry: String?
    var countryList = ["India", "USA", "UK", "Russia","China"]

    @IBOutlet weak var countryTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createPickerView()
        dismissPickerView()
    }

//picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countryList[row]
        countryTextField.text = selectedCountry
    }
    func createPickerView() {
           let pickerView = UIPickerView()
           pickerView.delegate = self
            countryTextField.inputView = pickerView
    }
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
       let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
        countryTextField.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
    }

}