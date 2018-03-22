//
//  LiveAnimation
//  FacebookLiveAnimation
//
//  Created by Abcplusd on 3/25/17.
//  Copyright © 2017 Abcplusd. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class LiveAnimation: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var animationView: UIView!
    
    @IBOutlet weak var playPause: UIButton!
    @IBOutlet weak var addAnimButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    override func viewDidLoad(){
        super.viewDidLoad()

    }
    
    func createImageAnimation(image:UIImage){
    
        var imgWidth = 80
        var imgHeight = 35
        if image == #imageLiteral(resourceName: "AyqLo30.png"){
            imgWidth = 50
            imgHeight = 50
        }
        let animationImageView = UIImageView(frame: CGRect(x: -imgWidth, y: 250, width: imgWidth, height: imgHeight))
        animationImageView.image = image
        self.view.addSubview(animationImageView)
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = createAnimationPath()
        anim.duration = 3
        anim.fillMode = kCAFillModeForwards
        animationImageView.layer.add(anim, forKey: "postion")
        
    }
    
    func createAnimationPath() -> CGPath{
        let path = UIBezierPath()
        let randomControlPoint1 = CGPoint(x:200 + drand48() * 100 , y: 300 + drand48() * 100)
        let randomControlPoint2 = CGPoint(x:50 + drand48() * 100 , y: 50 + drand48() * 100)
        path.move(to: CGPoint(x: 450, y: 250))
        path.addCurve(to: CGPoint(x:0,y:150 + drand48() * 100), controlPoint1:randomControlPoint1, controlPoint2: randomControlPoint2)
        return path.cgPath
    }
    
    @IBAction func addAnimPressed(_ sender: UIButton) {
        let randomNo = drand48() * 10
        if randomNo > 5{
            createImageAnimation(image:#imageLiteral(resourceName: "facebook-like-icon-720x340.png"))
        }else{
            createImageAnimation(image:#imageLiteral(resourceName: "AyqLo30.png"))
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

