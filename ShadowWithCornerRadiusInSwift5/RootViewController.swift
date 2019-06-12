//
//  RootViewController.swift
//  TestingCornerRadiusWithShadow
//
//  Created by Alex Nagy on 12/06/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import TinyConstraints

class RootViewController: UIViewController {
    
    let myBlue = UIColor(red: 42/255, green: 126/255, blue: 254/255, alpha: 1.0)
    
    lazy var view1: UIView = {
        let v = UIView()
        v.backgroundColor = myBlue
        return v
    }()
    
    lazy var view2: UIView = {
        let v = UIView()
        v.backgroundColor = myBlue
        return v
    }()
    
    lazy var view3: SCImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "nyc.jpg"))
        
        let v = SCImageView(imageView, radius: 5, color: .black, offset: CGSize(width: 15, height: 15), opacity: 0.5, cornerRadius: 15)
        v.backgroundColor = myBlue
        return v
    }()
    
    lazy var view4: SCButtonView = {
        let button = UIButton()
        button.setTitle("Tap me", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let v = SCButtonView(button, radius: 5, color: .black, offset: CGSize(width: 15, height: 15), opacity: 0.5, cornerRadius: 15)
        v.backgroundColor = myBlue
        return v
    }()
    
    @objc fileprivate func buttonTapped() {
        print("Tapped")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        
        view1.corners(15)
        view2.shadow(radius: 5, color: .black, offset: CGSize(width: 15, height: 15), opacity: 0.5)
        
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        
        view1.centerXToSuperview()
        view1.topToSuperview(offset: 50, usingSafeArea: true)
        view1.size(CGSize(width: 200, height: 150))
        
        view2.centerX(to: view1)
        view2.topToBottom(of: view1, offset: 50)
        view2.size(to: view1)
        
        view3.centerX(to: view1)
        view3.topToBottom(of: view2, offset: 50)
        view3.size(to: view1)
        
        view4.centerX(to: view1)
        view4.topToBottom(of: view3, offset: 50)
        view4.size(CGSize(width: 200, height: 45))
    }

}

extension UIView {
    @discardableResult
    func corners(_ radius: CGFloat) -> UIView {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func shadow(radius: CGFloat, color: UIColor, offset: CGSize, opacity: Float) -> UIView {
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        return self
    }
    
}

class SCView: UIView {
    
    init(radius: CGFloat, color: UIColor, offset: CGSize, opacity: Float, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SCImageView: UIView {
    init(_ imageView: UIImageView, radius: CGFloat, color: UIColor, offset: CGSize, opacity: Float, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        layer.masksToBounds = false
        
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        addSubview(imageView)
        imageView.edgesToSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SCButtonView: UIView {
    init(_ button: UIButton, radius: CGFloat, color: UIColor, offset: CGSize, opacity: Float, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        layer.masksToBounds = false
        
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
        addSubview(button)
        button.edgesToSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


