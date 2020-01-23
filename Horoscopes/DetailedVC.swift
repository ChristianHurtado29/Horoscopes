//
//  DetailedVC.swift
//  Horoscopes
//
//  Created by Christian Hurtado on 1/16/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class DetailedVC: UIViewController {
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var textSpace: UITextView!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var keywordsLabel: UILabel!
    @IBOutlet weak var intensityLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var selectedName: String?
    var picked: String?
    var horoscope: Horoscope?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(selectedName ?? "No name")'s profile!"
        signLabel.text = picked
        getHoroscope()
    }
    
    func getHoroscope(){
        HoroscopeAPI.getHoroscope(for: (picked?.lowercased())!) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let horoscope):
                self?.horoscope = horoscope
                DispatchQueue.main.async {
                    self?.textSpace.text = horoscope.horoscope
                    self?.moodLabel.text = horoscope.meta.mood
                    self?.keywordsLabel.text = horoscope.meta.keywords
                    self?.intensityLabel.text = horoscope.meta.intensity
                }
            }
        }
}
}
