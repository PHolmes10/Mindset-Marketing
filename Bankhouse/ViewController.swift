//
//  ViewController.swift
//  Bankhouse
//
//  Created by Patrick Holmes on 6/27/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var howWeWorkButton: UIButton!
    
    @IBOutlet weak var ourTeachingsButton: UIButton!
    
    @IBOutlet weak var latestNewsButton: UIButton!
    
    @IBOutlet weak var podcastButton: UIButton!
    
    @IBOutlet weak var upcomingEventsButton: UIButton!
    
    @IBOutlet weak var membersAreaButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor (red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)

        howWeWorkButton.setBackgroundImage(UIImage(named: "howWeWork"), for: .normal)
//        howWeWorkButton.setTitle("How We Work", for: .normal)
//        howWeWorkButton.titleLabel?.backgroundColor = UIColor.white

        ourTeachingsButton.setBackgroundImage(UIImage(named: "ourTeachings2"), for: .normal)
//        ourTeachingsButton.setTitle("Our Teachings", for: .normal)
//        ourTeachingsButton.titleLabel?.textAlignment = .center

        
        latestNewsButton.setBackgroundImage(UIImage(named: "latestNews"), for: .normal)
//        latestNewsButton.setTitle("Latest News", for: .normal)
        
        podcastButton.setBackgroundImage(UIImage(named: "podcast"), for: .normal)
//        podcastButton.setTitle("Podcast", for: .normal)
        
        upcomingEventsButton.setBackgroundImage(UIImage(named: "upcomingEvents2"), for: .normal)
//        upcomingEventsButton.setTitle("Upcoming Events", for: .normal)
        
        membersAreaButton.setBackgroundImage(UIImage(named: "membersArea"), for: .normal)
//        membersAreaButton.setTitle("Members Area", for: .normal)
        
        
//        howWeWorkButton.imageView?.contentMode = .scaleAspectFill
//
//        ourTeachingsButton.imageView?.contentMode = .scaleAspectFill
//
//        latestNewsButton.imageView?.contentMode = .scaleAspectFill
//
//        podcastButton.imageView?.contentMode = .scaleAspectFill
//
//        upcomingEventsButton.imageView?.contentMode = .scaleAspectFill
//
//        membersAreaButton.imageView?.contentMode = .scaleAspectFill
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        howWeWorkButton.subviews.first?.contentMode = .scaleAspectFill
        
        ourTeachingsButton.subviews.first?.contentMode = .scaleAspectFill
        
        latestNewsButton.subviews.first?.contentMode = .scaleAspectFill
        
        podcastButton.subviews.first?.contentMode = .scaleAspectFill
        
        upcomingEventsButton.subviews.first?.contentMode = .scaleAspectFill
        
        membersAreaButton.subviews.first?.contentMode = .scaleAspectFill
        
    }

}

