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
    button.addParalaxEffect(.moveShadow)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    makeLayout()
  }
  
  private func makeLayout() {
    view.addSubview(motionEffectButton)
    motionEffectButton.center = view.center
  }
}

extension UIButton {
  
  enum ParalaxEffectType {
    case moveButton
    case moveShadow
  }
  
  func addParalaxEffect(
    _ type: ParalaxEffectType,
    relative: Int = 16,
    shadow: Bool = true,
    radius: CGFloat = 5,
    opacity: Float = 0.8
  ) {
    
    let horisontalEffect = UIInterpolatingMotionEffect(
      keyPath: type == .moveButton ? "center.x" : "layer.shadowOffset.width",
      type: .tiltAlongHorizontalAxis
    )
    
    let verticalEffect = UIInterpolatingMotionEffect(
      keyPath: type == .moveButton ? "center.y" : "layer.shadowOffset.height",
      type: .tiltAlongVerticalAxis
    )
    
    let effectGroup = UIMotionEffectGroup()
    
    horisontalEffect.minimumRelativeValue = relative
    horisontalEffect.maximumRelativeValue = -relative
    
    verticalEffect.minimumRelativeValue = relative
    verticalEffect.maximumRelativeValue = -relative
    
    effectGroup.motionEffects = [horisontalEffect, verticalEffect]
    
    self.addMotionEffect(effectGroup)
    
    if type == .moveShadow || shadow {
      self.layer.shadowOpacity = opacity
      self.layer.shadowRadius = radius
      self.layer.shadowColor = UIColor.black.cgColor
      self.layer.shadowOffset = CGSize(width: relative, height: relative)
    }
  }
}
