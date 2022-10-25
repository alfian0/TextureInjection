//
//  ViewController.swift
//  TextureInjection
//
//  Created by M. Alfiansyah Nur Cahya Putra on 11/04/22.
//

import UIKit
import TTKit

class ViewController: TTViewController {
    let imageView: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "face")
        v.contentMode = .scaleAspectFill
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var button: UIButton = {
        let v = UIButton()
        v.setTitle("Convert", for: .normal)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.addTarget(self, action: #selector(onTapConvert), for: .touchUpInside)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }

    override func configureView() {
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc
    private func onTapConvert() {
        imageView.image = OpenCVWrapper.classifyImage(imageView.image!)
    }
}

