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
    
    let movingShadowHorisontalEffect = UIInterpolatingMotionEffect(
        keyPath: "layer.shadowOffset.width",
        type: .tiltAlongHorizontalAxis
    )
    
    let movingShadowVerticalEffect = UIInterpolatingMotionEffect(
        keyPath: "layer.shadowOffset.height",
        type: .tiltAlongVerticalAxis
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeLayout()
        addShadowMovingEffect()
    }
    
    private func makeLayout() {
        view.addSubview(motionEffectButton)
        motionEffectButton.center = view.center
    }

    private func addShadowMovingEffect() {
        let effectGroup = UIMotionEffectGroup()
        
        movingShadowHorisontalEffect.minimumRelativeValue = 50
        movingShadowHorisontalEffect.maximumRelativeValue = -50
        
        movingShadowVerticalEffect.minimumRelativeValue = 50
        movingShadowVerticalEffect.maximumRelativeValue = -50
        
        effectGroup.motionEffects = [movingShadowHorisontalEffect, movingShadowVerticalEffect]
        
        motionEffectButton.layer.shadowOpacity = 0.8
        motionEffectButton.layer.shadowRadius = 15
        motionEffectButton.layer.shadowColor = UIColor.black.cgColor
        motionEffectButton.layer.shadowOffset = CGSize(width: 0, height: 26)
        motionEffectButton.addMotionEffect(effectGroup)
    }
}
