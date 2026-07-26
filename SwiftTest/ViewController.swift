//
//  ViewController.swift
//  SwiftTest
//
//  Created by xk work's computer on 2026/6/5.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // 标题文本
        let titleLabel = UILabel()
        titleLabel.text = "欢迎使用 SwiftTest"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // 副标题文本
        let subtitleLabel = UILabel()
        subtitleLabel.text = "这是一个简单的示例页面"
        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.textColor = .gray
        subtitleLabel.textAlignment = .center
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)
        
        // 主按钮
        let primaryButton = UIButton(type: .system)
        primaryButton.setTitle("点击我", for: .normal)
        primaryButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        primaryButton.backgroundColor = .systemBlue
        primaryButton.setTitleColor(.white, for: .normal)
        primaryButton.layer.cornerRadius = 8
        primaryButton.translatesAutoresizingMaskIntoConstraints = false
        primaryButton.addTarget(self, action: #selector(primaryButtonTapped), for: .touchUpInside)
        view.addSubview(primaryButton)
        
        // 次要按钮：进入 MBProgressHUD 使用示例页面
        let secondaryButton = UIButton(type: .system)
        secondaryButton.setTitle("MBProgressHUD 示例", for: .normal)
        secondaryButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        secondaryButton.setTitleColor(.systemBlue, for: .normal)
        secondaryButton.layer.borderWidth = 1
        secondaryButton.layer.borderColor = UIColor.systemBlue.cgColor
        secondaryButton.layer.cornerRadius = 8
        secondaryButton.translatesAutoresizingMaskIntoConstraints = false
        secondaryButton.addTarget(self, action: #selector(secondaryButtonTapped), for: .touchUpInside)
        view.addSubview(secondaryButton)
        
        // 底部说明文本
        let footerLabel = UILabel()
        footerLabel.text = "版本 1.0.0"
        footerLabel.font = UIFont.systemFont(ofSize: 12)
        footerLabel.textColor = .lightGray
        footerLabel.textAlignment = .center
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footerLabel)
        
        // 布局约束
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            
//            primaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            primaryButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
//            primaryButton.widthAnchor.constraint(equalToConstant: 200),
//            primaryButton.heightAnchor.constraint(equalToConstant: 44),
            
            secondaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondaryButton.topAnchor.constraint(equalTo: primaryButton.bottomAnchor, constant: 16),
            secondaryButton.widthAnchor.constraint(equalToConstant: 200),
            secondaryButton.heightAnchor.constraint(equalToConstant: 44),
            
            footerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footerLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
        primaryButton.snp.makeConstraints { make in

            make.centerX.equalToSuperview()
            make.top.equalTo(subtitleLabel.snp.bottom)
            make.width.equalTo(200)
            make.height.equalTo(44)
        }
        
        
    }
    
    @objc func primaryButtonTapped() {
        // 跳转到组件展示页面
        let componentsVC = ComponentsViewController()
        navigationController?.pushViewController(componentsVC, animated: true)
    }
    
    @objc func secondaryButtonTapped() {
        // 跳转到 MBProgressHUD 常见使用场景页面
        let examplesViewController = MBProgressHUDExamplesViewController()
        navigationController?.pushViewController(examplesViewController, animated: true)
    }


}

