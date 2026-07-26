//
//  MBProgressHUDExamplesViewController.swift
//  SwiftTest
//
//  MBProgressHUD 常见使用场景示例
//

import UIKit
import MBProgressHUD

final class MBProgressHUDExamplesViewController: UIViewController {

    private var progressTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MBProgressHUD 示例"
        view.backgroundColor = .systemBackground
        setupUI()
    }

    deinit {
        progressTimer?.invalidate()
    }

    private func setupUI() {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "点击按钮查看效果，代码中包含适合新手阅读的注释。"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.font = .systemFont(ofSize: 15)

        let stackView = UIStackView(arrangedSubviews:      [
            descriptionLabel,
            makeButton(title: "1. 网络请求加载中", color: .systemBlue, action: #selector(showLoading)),
            makeButton(title: "2. 操作成功 ok", color: .systemGreen, action: #selector(showSuccess)),
            makeButton(title: "3. 操作失败", color: .systemRed, action: #selector(showError)),
            makeButton(title: "4. 纯文字提示", color: .systemOrange, action: #selector(showText)),
            makeButton(title: "5. 下载进度", color: .systemPurple, action: #selector(showProgress)),
            makeButton(title: "6. 延迟显示", color: .systemTeal, action: #selector(showDelayedLoading))
        ])
   
        
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    private func makeButton(title: String, color: UIColor, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
//        button.setTitle("哈哈哈", for: .highlighted)
        
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = color
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    // MARK: - 场景 1：网络请求加载中

    @objc private func showLoading() {
        // showAdded 会创建 HUD、添加到当前页面并立即显示。
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.label.text = "加载中..."
        hud.detailsLabel.text = "模拟网络请求，请稍候"

        // 实际项目中，应在网络请求回调里隐藏 HUD。
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self, weak hud] in
            guard self != nil else { return }
            hud?.hide(animated: true)
        }
    }

    // MARK: - 场景 2：成功提示

    @objc private func showSuccess() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView
        hud.customView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        hud.customView?.tintColor = .systemGreen
        hud.label.text = "保存成功"
        hud.detailsLabel.text = "数据已经保存到本地"
        hud.hide(animated: true, afterDelay: 1.5)
    }

    // MARK: - 场景 3：失败提示

    @objc private func showError() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView
        hud.customView = UIImageView(image: UIImage(systemName: "xmark.circle.fill"))
        hud.customView?.tintColor = .systemRed
        hud.label.text = "请求失败"
        hud.detailsLabel.text = "请检查网络后重试"
        hud.hide(animated: true, afterDelay: 1.8)
    }

    // MARK: - 场景 4：纯文字提示

    @objc private func showText() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = "请先填写用户名"
        hud.margin = 16
        hud.offset.y = 120 // 正数表示向页面下方移动。
        hud.hide(animated: true, afterDelay: 1.5)
    }

    // MARK: - 场景 5：下载进度

    @objc private func showProgress() {
        progressTimer?.invalidate()

        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .annularDeterminate
        hud.label.text = "正在下载"
        hud.progress = 0

        var progress: Float = 0
        progressTimer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { [weak self, weak hud] timer in
            progress += 0.02
            hud?.progress = progress
            hud?.detailsLabel.text = "\(Int(progress * 100))%"

            if progress >= 1 {
                timer.invalidate()
                self?.progressTimer = nil
                hud?.mode = .customView
                hud?.customView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
                hud?.customView?.tintColor = .systemGreen
                hud?.label.text = "下载完成"
                hud?.detailsLabel.text = nil
                hud?.hide(animated: true, afterDelay: 1)
            }
        }
    }

    // MARK: - 场景 6：延迟显示，避免快速请求造成 HUD 闪烁

    @objc private func showDelayedLoading() {
        let hud = MBProgressHUD(view: view)
        hud.label.text = "正在处理..."
        hud.graceTime = 0.5 // 任务超过 0.5 秒后才真正显示。
        hud.minShowTime = 0.5 // 一旦显示，至少停留 0.5 秒。
        hud.removeFromSuperViewOnHide = true
        view.addSubview(hud)
        hud.show(animated: true)

        // 模拟耗时任务；真实项目中在异步任务完成回调里调用 hide。
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak hud] in
            hud?.hide(animated: true)
        }
    }
}
