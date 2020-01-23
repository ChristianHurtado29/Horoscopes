//
//  ViewController.swift
//  Horoscopes
//
//  Created by Christian Hurtado on 1/16/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class BeginningVC: UIViewController {
    
    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet weak var signPicker: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var name = ""
    var picked = ""
    
    private var signs = ["Aries",
                         "Taurus",
                         "Gemini",
                         "Cancer",
                         "Leo",
                         "Virgo",
                         "Libra",
                         "Scorpio",
                         "Sagittarius",
                         "Capricorn",
                         "Aquarius",
                         "Pisces"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Please enter name"
        signLabel.isHidden = true
        signPicker.delegate = self
        signPicker.dataSource = self
        textFieldInput.delegate = self
        nextButton.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailedVC = segue.destination as? DetailedVC
        detailedVC?.selectedName = textFieldInput.text
        detailedVC?.picked = picked
    }
    
    @IBAction func nextButton(_ sender: Any) {
        UserDefaults.standard.set("\(picked)", forKey: picked)
        UserDefaults.standard.set("\(name)", forKey: name)
    }
}

extension BeginningVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return signs.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(signs[row])
        picked = signs[row]
        print(picked)
     //   UserDefaults.standard.set(signs[row], forKey: picked)
        UserPreference.shared.updateSign(with: signs[row])
    }
    
}

extension BeginningVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return signs[row]
    }
}

extension BeginningVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameLabel.text = "Welcome \(textField.text ?? "no name")!"
        signLabel.isHidden = false
        signLabel.text = "\(textField.text ?? "no name") please select your sign"
        textFieldInput.resignFirstResponder()
        UserDefaults.standard.set(textField.text, forKey: name)
        nextButton.isHidden = false
        UserPreference.shared.updateName(with: textField.text ?? "no name")
        return true
    }
}
