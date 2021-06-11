//
//  HomeViewController.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 13.05.2021..
//

import UIKit
import SnapKit

class MotivationViewController: UIViewController{

    
    
    let imageView = UIImageView()
    let quoteLabel = UILabel()
    let authorLabel = UILabel()
    
    
    private var titleLabel: UILabel!
    private var router: AppCoordinatorProtocol!
    private let motivationViewPresenter = MotivationPresenter(networking: NetworkService())
    
    
    convenience init(router: AppCoordinatorProtocol) {
        self.init()
        self.router = router
        title = "Motivation"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motivationViewPresenter.setMotivationViewDelegate(motivationViewDelegate: self)

        //UI
        buildViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        motivationViewPresenter.getData()
        quoteLabel.transform = quoteLabel.transform.translatedBy(x: 0, y: view.frame.height/4)
        authorLabel.transform = authorLabel.transform.translatedBy(x: 0, y: view.frame.height/4)
        authorLabel.alpha = 0
        quoteLabel.alpha = 0
    }
    
    func presentErrorAlert(){
        let alert = UIAlertController(title: "Whoops, seems like there's a problem with loading the quote.", message: "We'll try to fix it as soon as possible. \n Please try again later", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


//animations
extension MotivationViewController{
    
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 3,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: { [self] in
                        imageView.alpha = 1
                        self.view.layoutIfNeeded()
                       }
        )
        UIView.animate(withDuration: 3,
                       delay: 0.6,
                       options: [.curveEaseInOut],
                       animations: { [self] in
                        quoteLabel.alpha = 1
                        quoteLabel.transform = .identity
                        self.view.layoutIfNeeded()
                       }
        )
        UIView.animate(withDuration: 3,
                       delay: 0.6,
                       options: [.curveEaseInOut],
                       animations: { [self] in
                        authorLabel.alpha = 1
                        authorLabel.transform = .identity
                        self.view.layoutIfNeeded()
                       }
        )
        
    }
    
}
