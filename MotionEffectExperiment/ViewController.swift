import UIKit

class ViewController: UIViewController {
    
    let motionEffectButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        button.layer.cornerRadius = 15
        button.backgroundColor = .red
        button.setTitle("Press Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    let horisontalEffect = UIInterpolatingMotionEffect(
        keyPath: "center.x",//"layer.shadowOffset.width",
        type: .tiltAlongHorizontalAxis
    )
    
    let verticalEffect = UIInterpolatingMotionEffect(
        keyPath: "center.y",//"layer.shadowOffset.height",
        type: .tiltAlongVerticalAxis
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeLayout()
        //addShadow()
        addMovingEffect()
    }
    
    private func addShadow() {
        motionEffectButton.layer.shadowOpacity = 0.8
        motionEffectButton.layer.shadowRadius = 15
        motionEffectButton.layer.shadowColor = UIColor.black.cgColor
        motionEffectButton.layer.shadowOffset = CGSize(width: 0, height: 26)
    }
    
    private func makeLayout() {
        view.addSubview(motionEffectButton)
        motionEffectButton.center = view.center
    }

    private func addMovingEffect() {
        let effectGroup = UIMotionEffectGroup()
        
        horisontalEffect.minimumRelativeValue = 50
        horisontalEffect.maximumRelativeValue = -50
        
        verticalEffect.minimumRelativeValue = 50
        verticalEffect.maximumRelativeValue = -50
        
        effectGroup.motionEffects = [horisontalEffect, verticalEffect]
        
        motionEffectButton.addMotionEffect(effectGroup)
    }
}
