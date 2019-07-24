//
//  MyTabBarController.swift
//  Bankhouse
//
//  Created by Patrick Holmes on 7/23/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

//extension MyTabBarController: UITabBarControllerDelegate {
//
//    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return MyTransition(viewControllers: tabBarController.viewControllers)
//    }
//
//}
//
//class MyTransition: NSObject, UIViewControllerAnimatedTransitioning {
//
//    let viewControllers: [UIViewController]?
//    let transitionDuration: Double = 0.3
//
//    init(viewControllers: [UIViewController]?) {
//        self.viewControllers = viewControllers
//    }
//
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return TimeInterval(transitionDuration)
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//
//        guard
//            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
//            let fromView = fromVC.view,
//            let fromIndex = getIndex(forViewController: fromVC),
//            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
//            let toView = toVC.view,
//            let toIndex = getIndex(forViewController: toVC)
//            else {
//                transitionContext.completeTransition(false)
//                return
//        }
//
//        let frame = transitionContext.initialFrame(for: fromVC)
//        var fromFrameEnd = frame
//        var toFrameStart = frame
//        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
//        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
//        toView.frame = toFrameStart
//
//        DispatchQueue.main.async {
//            transitionContext.containerView.addSubview(toView)
//            UIView.animate(withDuration: self.transitionDuration, animations: {
//                fromView.frame = fromFrameEnd
//                toView.frame = frame
//            }, completion: {success in
//                fromView.removeFromSuperview()
//                transitionContext.completeTransition(success)
//            })
//        }
//    }
//
//    func getIndex(forViewController vc: UIViewController) -> Int? {
//        guard let vcs = self.viewControllers else { return nil }
//        for (index, thisVC) in vcs.enumerated() {
//            if thisVC == vc { return index }
//        }
//        return nil
//    }
//}

extension MyTabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let index = self.tabBar.items?.firstIndex(of: item)
        let subView = tabBar.subviews[index!+1].subviews.first as! UIImageView
        self.performSpringAnimation(imgView: subView)
    }
    
    func performSpringAnimation(imgView: UIImageView) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            
            imgView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            
            //reducing the size
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                imgView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { (flag) in
            }
        }) { (flag) in
            
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard
            let tabViewControllers = tabBarController.viewControllers,
            let targetIndex = tabViewControllers.firstIndex(of: viewController),
            let targetView = tabViewControllers[targetIndex].view,
            let currentViewController = selectedViewController,
            let currentIndex = tabViewControllers.firstIndex(of: currentViewController)
            else { return false }
        
        if currentIndex != targetIndex {
            animateToView(targetView, at: targetIndex, from: currentViewController.view, at: currentIndex)
        }
        
        return true
    }
    
}

private extension MyTabBarController {
    
    func animateToView(_ toView: UIView, at toIndex: Int, from fromView: UIView, at fromIndex: Int) {
        // Position toView off screen (to the left/right of fromView)
        let screenWidth = UIScreen.main.bounds.size.width
        let offset = toIndex > fromIndex ? screenWidth : -screenWidth
        
        toView.frame.origin = CGPoint(
            x: toView.frame.origin.x + offset,
            y: toView.frame.origin.y
        )
        
        fromView.superview?.addSubview(toView)
        
        // Disable interaction during animation
        view.isUserInteractionEnabled = false
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 0.75,
            initialSpringVelocity: 0.5,
            options: .curveEaseInOut,
            animations: {
                // Slide the views by -offset
                fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
                toView.center = CGPoint(x: toView.center.x - offset, y: toView.center.y)
        },
            completion: { _ in
                // Remove the old view from the tabbar view.
                fromView.removeFromSuperview()
                self.selectedIndex = toIndex
                self.view.isUserInteractionEnabled = true
        }
        )
    }
    
}
