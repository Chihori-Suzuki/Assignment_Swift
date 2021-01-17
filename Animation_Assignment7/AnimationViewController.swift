//
//  AnimationViewController.swift
//  Animation_Assignment7
//
//  Created by 鈴木ちほり on 2021/01/14.
//

import UIKit

class AnimationViewController: UIViewController {

    var navBarStatus = false
    let ivOne = UIImageView(image: UIImage(named: "oreos"))
    let ivTwo = UIImageView(image: UIImage(named: "pizza_pockets"))
    let ivThree = UIImageView(image: UIImage(named: "pop_tarts"))
    let ivFour = UIImageView(image: UIImage(named: "popsicle"))
    let ivFive = UIImageView(image: UIImage(named: "ramen"))
    
    let navBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0xDDDDDD)
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
    let navStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(navBar)
        view.addSubview(plusBtn)
        
        navStackView.isHidden = true
        navBar.addSubview(navStackView)
        
        setView()
        
    }
    
    func setView(){
        navBar.heightAnchor.constraint(equalToConstant: 88).isActive = true
        navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        plusBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -5).isActive = true
        plusBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        
        navStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        navStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        navStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        navStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        navStackView.addArrangedSubview(ivOne)
        navStackView.addArrangedSubview(ivTwo)
        navStackView.addArrangedSubview(ivThree)
        navStackView.addArrangedSubview(ivFour)
        navStackView.addArrangedSubview(ivFive)
    }
    
    func animation() {
        if !navBarStatus {
            UIView.animate(withDuration: 1.5) {
                let scaleTransform = CGAffineTransform(scaleX: 1.0, y: 3.5)
                self.navBar.transform = scaleTransform
                _ = CGAffineTransform(translationX: self.view.frame.size.width / 2 - 50, y: self.view.frame.size.height / 2 - 50)
                self.plusBtn.transform = CGAffineTransform(rotationAngle: .pi/4)
                self.navStackView.isHidden = false
            }
            navBarStatus = true
        } else {
            UIView.animate(withDuration: 1.5){
                self.navBar.transform = .identity
                self.plusBtn.transform = .identity
                self.navStackView.isHidden = true
            }
            navBarStatus = false
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


extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xDD,
           green: (rgb >> 8) & 0xDD,
           blue: rgb & 0xDD
       )
   }
}
