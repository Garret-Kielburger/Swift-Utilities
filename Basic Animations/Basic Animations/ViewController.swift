//
//  ViewController.swift
//  Basic Animations
//
//  Created by Garret Kielburger on 2021-10-04.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    let duration = 3.5
    var horizontal_run = false
    var resize_run = false
    
    // MARK: IBOutlets
    @IBOutlet weak var gradientCircleColourChange: GradientCircleView!
    @IBOutlet weak var gradientCircleRotate: GradientCircleView!
    @IBOutlet weak var horizontalMovementImageView: UIImageView!
    @IBOutlet weak var resizeImageImageView: UIImageView!
    
    
    // MARK: Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateAll()
    }
    
    
    // MARK: Private Functions
    private func animateAll() {
        
        // Animate GradientCircleRotate
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [.curveLinear], animations: {
            self.gradientCircleRotate.transform = self.gradientCircleRotate.transform.rotated(by: CGFloat(Double.pi))
            self.gradientCircleRotate.transform = self.gradientCircleRotate.transform.rotated(by: CGFloat(Double.pi))
        })
        
        // Animate GradientCircleColourChange
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [.curveLinear], animations: {
            self.gradientCircleColourChange.endColor = .systemBlue
        })
        
        
    }
    

    
    // MARK: IBActions
    @IBAction func gradientCircleButton_TouchUpInside(_ sender: Any) {
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [.curveLinear], animations: {
            self.gradientCircleRotate.transform = self.gradientCircleRotate.transform.rotated(by: CGFloat(Double.pi))
            self.gradientCircleRotate.transform = self.gradientCircleRotate.transform.rotated(by: CGFloat(Double.pi))
        })
    }
    
    @IBAction func gradientCircleColourChange_TouchUpInside(_ sender: Any) {
        
        let animator = UIViewPropertyAnimator(duration: duration, curve: .linear, animations: {})
        
        if self.gradientCircleColourChange.endColor == .systemBlue {
            animator.addAnimations {
                self.gradientCircleColourChange.endColor = .systemRed
            }
            
        } else if self.gradientCircleColourChange.endColor == .systemRed {
            animator.addAnimations {
                self.gradientCircleColourChange.endColor = .systemGreen
            }

        } else if self.gradientCircleColourChange.endColor == .systemGreen {
            animator.addAnimations {
                self.gradientCircleColourChange.endColor = .systemBlue
            }
        }
        animator.startAnimation()
    }
    
    @IBAction func moveHorizontally_TouchUpInside(_ sender: Any) {
        print("button click")
    
        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.5, animations: {})
        
        if horizontal_run {
            animator.addAnimations {
                self.horizontalMovementImageView.frame = self.horizontalMovementImageView.frame.offsetBy(dx: -250, dy: 0)
            }
            horizontal_run = false
        } else {
            animator.addAnimations {
                self.horizontalMovementImageView.frame = self.horizontalMovementImageView.frame.offsetBy(dx: 250, dy: 0)
            }
            horizontal_run = true
        }
        animator.startAnimation()
    }
    
    
    @IBAction func resizeImageButton_TouchUpInside(_ sender: Any) {
        
//        let springTiming = UISpringTimingParameters(mass: 1.0, stiffness: 2.0, damping: 0.5, initialVelocity: .zero)
        
//        let anim = UIViewPropertyAnimator(duration: duration, timingParameters: springTiming)
        
        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeIn, animations: {})
        
        if resize_run {
            animator.addAnimations {
                self.resizeImageImageView.transform = self.resizeImageImageView.transform.scaledBy(x: 2.0, y: 2.0)
            }
            resize_run = false
        } else {
            animator.addAnimations {
                self.resizeImageImageView.transform = self.resizeImageImageView.transform.scaledBy(x: 0.5, y: 0.5)
            }
            resize_run = true
        }
        animator.startAnimation()
    }
    
    
    
}

