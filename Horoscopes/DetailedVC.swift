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
        signLabel.backgroundColor = .white
        signLabel.alpha = 0.75
        textSpace.alpha = 0.7
        moodLabel.backgroundColor = .white
        moodLabel.alpha = 0.8
        keywordsLabel.backgroundColor = .white
        keywordsLabel.alpha = 0.7
        intensityLabel.backgroundColor = .white
        intensityLabel.alpha = 0.6
        getHoroscope()
    }
    
    func getHoroscope(){
        HoroscopeAPI.getHoroscope(for: (picked?.lowercased()) ?? "aries") { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let horoscope):
                self?.horoscope = horoscope
                DispatchQueue.main.async {
                    self?.textSpace.text = horoscope.horoscope
                    self?.moodLabel.text = "Mood: \(horoscope.meta.mood)"
                    self?.keywordsLabel.text = "Keywords: \(horoscope.meta.keywords)"
                    self?.intensityLabel.text = "Intensity: \(horoscope.meta.intensity)"
                    self?.backgroundImageView.image = UIImage(named: self!.picked!)
                }
            }
        }
}
}
