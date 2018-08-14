//
//  SecViewController.swift
//  FinalWeather
//
//  Created by xcode on 2/24/18.
//  Copyright © 2018 xcode. All rights reserved.
//

import UIKit

class SecViewController: UIViewController {
    
    @IBOutlet var roundedImgView: UIImageView!
    @IBOutlet var roundedTitleView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    
    @IBOutlet var tempHighLabel: UILabel!
    @IBOutlet var tempLowLabel: UILabel!
    
    
    @IBOutlet var bgImageView: UIImageView!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    var userLocal:String?
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whatBackground()
        
        tempHighLabel.text = "\(Int((weather?.temperatureHigh)!)) °F High"
        tempLowLabel.text = "\(Int((weather?.temperatureLow)!)) °F Low"
        
        cityLabel.text = userLocal
        summaryLabel.text = weather?.summary
        tempLabel.text = "\(Int((weather?.temperature)!)) °F"
        
        //rounding image view that lays behind details in VC
        roundedImgView.layer.cornerRadius = 8.0
        roundedImgView.clipsToBounds = true
        
        //rounding title view under the city title:
        roundedTitleView.layer.cornerRadius = 8.0
        roundedTitleView.clipsToBounds = true
}
    
    //changing background based upon the icon inside table view controller when clicked
    func whatBackground() {
        if weather?.icon == "clear-day" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "sunClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        if weather?.icon == "clear-night" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "nightClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        if weather?.icon == "cloudy" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "cloudyClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        if weather?.icon == "fog" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "fogClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        if weather?.icon == "partly-cloudy-day" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "partlyCloudyClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        if weather?.icon == "partly-cloudy-night" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "nightCloudClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        if weather?.icon == "rain" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "rainClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        if weather?.icon == "sleet" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "rainClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        if weather?.icon == "snow" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "snowClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        if weather?.icon == "wind" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "windyClear")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            self.view.backgroundColor = UIColor(patternImage: image)
        }
  }
    
}





