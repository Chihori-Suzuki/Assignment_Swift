//
//  AnimationViewController.swift
//  Animation_Assignment7
//
//  Created by 鈴木ちほり on 2021/01/14.
//

import UIKit

class AnimationViewController: UIViewController {

    let navBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    let plusBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("＋", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.addTarget(self, action: #selector(pushBtn(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(navBar)
        view.addSubview(plusBtn)
        
        setView()
        
    }
    
    func setView(){
        navBar.heightAnchor.constraint(equalToConstant: 88).isActive = true
        navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        plusBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -5).isActive = true
        plusBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        
        
    }
    
    func animation() {
        UIView.animate(withDuration: 3.0) {
            let scaleTransform = CGAffineTransform(scaleX: 1.0, y: 3.5)
            self.navBar.transform = scaleTransform
            let translateTransform = CGAffineTransform(translationX: self.view.frame.size.width / 2 - 50, y: self.view.frame.size.height / 2 - 50)
            let rotateTransform = CGAffineTransform(rotationAngle: .pi/2)
//            plusBtn.transform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
        }
    }
    
    @objc func pushBtn(_ sender: UIButton) {
        print("plus icon pressed")
        animation()
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
