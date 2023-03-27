//
//  ViewController.swift
//  SpotifyStackView
//
//  Created by Shah Md Imran Hossain on 28/3/23.
//

import UIKit

class ViewController: UIViewController {
    let margin: CGFloat = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    func setupNavigationBar() {
        navigationItem.title = "Playback"
    }
    
    /*
     
     Challenge: See if you can embed all these controls in a StackView like this.
 
     ┌────────StackView─────────┐
     │                          │
     │        offlineRow        │
     │                          │
     │      offlineSublabel     │
     │                          │   axis = vertical
     │       crossfadeView      │   distribution = fill
     │                          │   alignment = fill
     │        gaplessRow        │   spacing = 20
     │                          │
     │       hideSongsRow       │
     │                          │
     │     normalizationRow     │
     │                          │
     └──────────────────────────┘
     
     */
    
    func setupViews() {
        let stackView = makeStackView(withOrientation: .vertical, spacing: margin)
        
        let offline = RowView(labelText: "Offline", isSwitchOn: false)
        let offlineSublabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        
        let crossFade = CrossfadeView()
        let gaplessPlayback = RowView(labelText: "Gapless Playback", isSwitchOn: true)
        let hideSong = RowView(labelText: "Hide Unplayable Songs", isSwitchOn: true)
        let enableNormalization = RowView(labelText: "Enable Audio Normalization", isSwitchOn: true)
        
        offline.translatesAutoresizingMaskIntoConstraints = false
        offlineSublabel.translatesAutoresizingMaskIntoConstraints = false
        crossFade.translatesAutoresizingMaskIntoConstraints = false
        gaplessPlayback.translatesAutoresizingMaskIntoConstraints = false
        hideSong.translatesAutoresizingMaskIntoConstraints = false
        enableNormalization.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)
        
        stackView.addArrangedSubview(offline)
        stackView.addArrangedSubview(offlineSublabel)
        stackView.addArrangedSubview(crossFade)
        stackView.addArrangedSubview(gaplessPlayback)
        stackView.addArrangedSubview(hideSong)
        stackView.addArrangedSubview(enableNormalization)
        
        // stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: margin)
        ])
    }
}

