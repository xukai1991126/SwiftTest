//
//  ComponentsViewController.swift
//  SwiftTest
//
//  UIKit 常用组件示例
//

import UIKit

class ComponentsViewController: UIViewController {
    
    // MARK: - UI 组件属性
    
    // 用于存储 Slider 的当前值
    var sliderValue: Float = 50
    // 用于存储 Stepper 的当前值
    var stepperValue: Double = 0
    // 用于存储 Picker 的选中项
    var selectedPickerIndex = 0
    let pickerData = ["选项一", "选项二", "选项三", "选项四"]
    
    // MARK: - 生命周期方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIKit 组件示例"
        view.backgroundColor = .systemBackground
        
        // 创建 ScrollView 用于展示所有组件
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // 创建内容容器
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // 创建一个垂直堆栈视图来排列所有组件
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        // 布局 ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
        
        // 添加各种组件到堆栈视图
        stackView.addArrangedSubview(createTextSection())
        stackView.addArrangedSubview(createImageSection())
        stackView.addArrangedSubview(createButtonSection())
        stackView.addArrangedSubview(createTextFieldSection())
        stackView.addArrangedSubview(createToggleSection())
        stackView.addArrangedSubview(createSliderSection())
        stackView.addArrangedSubview(createStepperSection())
        stackView.addArrangedSubview(createPickerSection())
        stackView.addArrangedSubview(createProgressSection())
        stackView.addArrangedSubview(createAlertButtonSection())
    }
    
    // MARK: - 组件创建方法
    
    // ==================== Text 文本组件 ====================
    func createTextSection() -> UIView {
        let container = createSectionContainer(title: "1. Text 文本 (UILabel)")
        
        // 基本文本
        let label1 = UILabel()
        label1.text = "这是一个基本文本标签"
        label1.font = UIFont.systemFont(ofSize: 16)
        label1.textColor = .label
        container.addSubview(label1)
        
        // 多行文本
        let label2 = UILabel()
        label2.text = "这是一个多行文本示例，可以自动换行显示更多内容多行文本示例，可以自动换行显示更多内容多行文本示例，可以自动换行显示更多内容多行文本示例，可以自动换行显示更多内容多行文本示例，可以自动换行显示更多内容"
        label2.font = UIFont.systemFont(ofSize: 14)
        label2.textColor = .secondaryLabel
        label2.numberOfLines = 2  // 0 表示不限制行数，自动换行
        container.addSubview(label2)
        
        // ==================== 富文本示例 ====================
        // 富文本可以给不同范围的文字设置不同的样式（颜色、字体、下划线、删除线等）
        let label3 = UILabel()
        label3.numberOfLines = 0  // 支持多行显示
        
        // 创建富文本字符串
        let fullText = "富文本示例：红色加粗、蓝色斜体、绿色下划线、删除线、字间距、行间距、阴影效果、背景色、链接样式"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // 1. 设置整段文字的基础字体
        let baseFont = UIFont.systemFont(ofSize: 15)
        attributedString.addAttribute(.font, value: baseFont, range: NSRange(location: 0, length: fullText.count))
        
        // 2. "红色加粗" - 设置颜色和粗体
        let redBoldRange = NSRange(location: 6, length: 4)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemRed, range: redBoldRange)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range: redBoldRange)
        
        // 3. "蓝色斜体" - 设置颜色和斜体
        let blueItalicRange = NSRange(location: 11, length: 4)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: blueItalicRange)
        let italicFont = UIFont.italicSystemFont(ofSize: 15)
        attributedString.addAttribute(.font, value: italicFont, range: blueItalicRange)
        
        // 4. "绿色下划线" - 设置颜色和下划线
        let greenUnderlineRange = NSRange(location: 16, length: 5)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: greenUnderlineRange)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: greenUnderlineRange)
        // 下划线颜色可以单独设置
        attributedString.addAttribute(.underlineColor, value: UIColor.systemGreen, range: greenUnderlineRange)
        
        // 5. "删除线" - 设置删除线样式
        let strikethroughRange = NSRange(location: 22, length: 3)
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: strikethroughRange)
        attributedString.addAttribute(.strikethroughColor, value: UIColor.systemRed, range: strikethroughRange)
        
        // 6. "字间距" - 设置字符间距
        let kernRange = NSRange(location: 26, length: 3)
        attributedString.addAttribute(.kern, value: 5, range: kernRange)  // 字符间距 5pt
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemPurple, range: kernRange)
        
        // 7. "行间距" - 这个需要通过段落样式来设置，在后面统一设置
        
        // 8. "阴影效果" - 设置文字阴影
        let shadowRange = NSRange(location: 30, length: 4)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.gray.withAlphaComponent(0.5)
        shadow.shadowOffset = CGSize(width: 2, height: 2)  // 阴影偏移
        shadow.shadowBlurRadius = 2  // 阴影模糊半径
        attributedString.addAttribute(.shadow, value: shadow, range: shadowRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemOrange, range: shadowRange)
        
        // 9. "背景色" - 设置文字背景色
        let bgRange = NSRange(location: 35, length: 3)
        attributedString.addAttribute(.backgroundColor, value: UIColor.systemYellow.withAlphaComponent(0.3), range: bgRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBrown, range: bgRange)
        
        // 10. "链接样式" - 设置链接样式（注意：UILabel 默认不可点击，需要配合 UITextView 或添加手势）
        let linkRange = NSRange(location: 39, length: 4)
        attributedString.addAttribute(.link, value: "https://www.apple.com", range: linkRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: linkRange)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: linkRange)
        
        // 11. 设置段落样式（行间距、段落间距、对齐方式等）
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8  // 行间距
        paragraphStyle.paragraphSpacing = 10  // 段落间距
        paragraphStyle.alignment = .left  // 文本对齐方式
        paragraphStyle.lineBreakMode = .byWordWrapping  // 换行模式
        paragraphStyle.firstLineHeadIndent = 0  // 首行缩进
        paragraphStyle.headIndent = 0  // 整体缩进
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: fullText.count))
        
        // 将富文本赋值给 label
        label3.attributedText = attributedString
        container.addSubview(label3)
        
        // ==================== 更多富文本技巧 ====================
        
        // 组合样式示例：同时设置多种属性
        let label4 = UILabel()
        let comboText = "组合样式：粗体斜体红色带阴影"
        let comboAttr = NSMutableAttributedString(string: comboText)
        
        // 创建一个包含所有属性的字典，一次性设置
        let comboAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 18),  // 粗体
            .foregroundColor: UIColor.systemRed,       // 红色
            .backgroundColor: UIColor.systemGray6,     // 背景色
            .underlineStyle: NSUnderlineStyle.thick.rawValue,  // 粗下划线
            .underlineColor: UIColor.systemBlue,       // 下划线颜色
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,  // 删除线
            .strikethroughColor: UIColor.systemGray,   // 删除线颜色
            .shadow: shadow,                           // 阴影
            .kern: 3                                   // 字间距
        ]
        comboAttr.addAttributes(comboAttributes, range: NSRange(location: 0, length: comboText.count))
        label4.attributedText = comboAttr
        container.addSubview(label4)
        
        // 图片和文字混排示例
        let label5 = UILabel()
        let attachment = NSTextAttachment()  // 文本附件，用于嵌入图片
        attachment.image = UIImage(systemName: "star.fill")  // 设置图片
        attachment.bounds = CGRect(x: 0, y: -3, width: 16, height: 16)  // 设置图片大小和位置偏移
        
        // 将附件转换为富文本
        let attachmentString = NSAttributedString(attachment: attachment)
        let textWithImage = NSMutableAttributedString(string: " 图片文字混排：")
        textWithImage.append(attachmentString)  // 添加图片
        textWithImage.append(NSAttributedString(string: " 星星图标 "))
        textWithImage.append(attachmentString)  // 再添加一个图片
        textWithImage.append(NSAttributedString(string: " 很方便！"))
        
        // 设置文字颜色
        textWithImage.addAttribute(.foregroundColor, value: UIColor.label, range: NSRange(location: 0, length: textWithImage.length))
        label5.attributedText = textWithImage
        container.addSubview(label5)
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            label1.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label1.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 12),
            label2.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label2.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 12),
            label3.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label3.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 16),
            label4.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label4.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant: 12),
            label5.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label5.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            label5.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
        ])
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        label4.translatesAutoresizingMaskIntoConstraints = false
        label5.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }
    
    // ==================== Image 图片组件 ====================
    func createImageSection() -> UIView {
        let container = createSectionContainer(title: "2. Image 图片 (UIImageView)")
        
        // 从系统图标加载图片
        let imageView1 = UIImageView()
        imageView1.image = UIImage(systemName: "star.fill")  // 使用 SF Symbols 系统图标
        imageView1.tintColor = .systemYellow
        imageView1.contentMode = .scaleAspectFit  // 内容模式：保持比例适应
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(imageView1)
        
        // 带圆角的图片
        let imageView2 = UIImageView()
        imageView2.backgroundColor = .systemBlue
        imageView2.layer.cornerRadius = 12  // 设置圆角
        imageView2.clipsToBounds = true     // 裁剪超出圆角的部分
        imageView2.contentMode = .center
        if let img = UIImage(systemName: "heart.fill") {
            imageView2.image = img.withTintColor(.white, renderingMode: .alwaysOriginal)
        }
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(imageView2)
        
        NSLayoutConstraint.activate([
            imageView1.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            imageView1.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            imageView1.widthAnchor.constraint(equalToConstant: 50),
            imageView1.heightAnchor.constraint(equalToConstant: 50),
            
            imageView2.topAnchor.constraint(equalTo: imageView1.topAnchor),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 16),
            imageView2.widthAnchor.constraint(equalToConstant: 50),
            imageView2.heightAnchor.constraint(equalToConstant: 50),
            imageView2.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
        ])
        
        return container
    }
    
    // ==================== Button 按钮组件 ====================
    func createButtonSection() -> UIView {
        let container = createSectionContainer(title: "3. Button 按钮 (UIButton)")
        
        // 系统样式按钮
        let button1 = UIButton(type: .system)
        button1.setTitle("系统按钮", for: .normal)  // 设置标题
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)  // 添加点击事件
        container.addSubview(button1)
        
        // 自定义样式按钮
        let button2 = UIButton(type: .custom)
        button2.setTitle("自定义按钮", for: .normal)
        button2.backgroundColor = .systemBlue
        button2.setTitleColor(.white, for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button2.layer.cornerRadius = 8          // 圆角
        button2.layer.shadowColor = UIColor.black.cgColor  // 阴影颜色
        button2.layer.shadowOffset = CGSize(width: 0, height: 2)  // 阴影偏移
        button2.layer.shadowOpacity = 0.3       // 阴影透明度
        button2.layer.shadowRadius = 4          // 阴影半径
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        container.addSubview(button2)
        
        // 带图标的按钮
        let button3 = UIButton(type: .system)
        button3.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)  // 设置图标
        button3.setTitle(" 带图标按钮", for: .normal)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        container.addSubview(button3)
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            button1.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            
            button2.topAnchor.constraint(equalTo: button1.topAnchor),
            button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 16),
            button2.widthAnchor.constraint(equalToConstant: 120),
            button2.heightAnchor.constraint(equalToConstant: 44),
            
            button3.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 12),
            button3.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            button3.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
        ])
        
        return container
    }
    
    // ==================== TextField 文本输入框 ====================
    func createTextFieldSection() -> UIView {
        let container = createSectionContainer(title: "4. TextField 文本输入框 (UITextField)")
        
        // 基本文本框
        let textField1 = UITextField()
        textField1.placeholder = "请输入用户名"  // 占位符文本
        textField1.borderStyle = .roundedRect    // 边框样式
        textField1.font = UIFont.systemFont(ofSize: 16)
        textField1.autocapitalizationType = .none  // 禁用自动大写
        textField1.autocorrectionType = .no        // 禁用自动纠错
        textField1.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(textField1)
        
        // 密码输入框（对应 SwiftUI 的 SecureField）
        let textField2 = UITextField()
        textField2.placeholder = "请输入密码"
        textField2.borderStyle = .roundedRect
        textField2.isSecureTextEntry = true  // 设置为密码输入模式（显示为圆点）
        textField2.font = UIFont.systemFont(ofSize: 16)
        textField2.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(textField2)
        
        // 带左边距的文本框
        let textField3 = UITextField()
        textField3.placeholder = "带左侧图标的输入框"
        textField3.borderStyle = .roundedRect
        // 设置左侧视图（图标）
        let leftView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        leftView.frame = CGRect(x: 8, y: 0, width: 24, height: 24)
        leftView.tintColor = .gray
        textField3.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 44))
        textField3.leftView?.addSubview(leftView)
        textField3.leftViewMode = .always  // 始终显示左侧视图
        textField3.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(textField3)
        
        NSLayoutConstraint.activate([
            textField1.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            textField1.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            textField1.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            textField1.heightAnchor.constraint(equalToConstant: 44),
            
            textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 12),
            textField2.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            textField2.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            textField2.heightAnchor.constraint(equalToConstant: 44),
            
            textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 12),
            textField3.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            textField3.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            textField3.heightAnchor.constraint(equalToConstant: 44),
            textField3.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
        ])
        
        return container
    }
    
    // ==================== Toggle 开关组件 ====================
    func createToggleSection() -> UIView {
        let container = createSectionContainer(title: "5. Toggle 开关 (UISwitch)")
        
        // 开关组件
        let toggle1 = UISwitch()
        toggle1.isOn = true  // 初始状态：开启
        toggle1.onTintColor = .systemGreen  // 开启时的颜色
        toggle1.thumbTintColor = .white     // 滑块颜色
        toggle1.translatesAutoresizingMaskIntoConstraints = false
        toggle1.addTarget(self, action: #selector(toggleValueChanged(_:)), for: .valueChanged)
        container.addSubview(toggle1)
        
        let label1 = UILabel()
        label1.text = "推送通知"
        label1.font = UIFont.systemFont(ofSize: 16)
        label1.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(label1)
        
        // 第二个开关
        let toggle2 = UISwitch()
        toggle2.isOn = false
        toggle2.onTintColor = .systemBlue
        toggle2.translatesAutoresizingMaskIntoConstraints = false
        toggle2.addTarget(self, action: #selector(toggleValueChanged(_:)), for: .valueChanged)
        container.addSubview(toggle2)
        
        let label2 = UILabel()
        label2.text = "深色模式"
        label2.font = UIFont.systemFont(ofSize: 16)
        label2.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(label2)
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            label1.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            
            toggle1.centerYAnchor.constraint(equalTo: label1.centerYAnchor),
            toggle1.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 16),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 12),
            label2.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label2.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
            
            toggle2.centerYAnchor.constraint(equalTo: label2.centerYAnchor),
            toggle2.leadingAnchor.constraint(equalTo: label2.trailingAnchor, constant: 16),
        ])
        
        return container
    }
    
    // ==================== Slider 滑块组件 ====================
    func createSliderSection() -> UIView {
        let container = createSectionContainer(title: "6. Slider 滑块 (UISlider)")
        
        let slider = UISlider()
        slider.minimumValue = 0      // 最小值
        slider.maximumValue = 100    // 最大值
        slider.value = sliderValue   // 当前值
        slider.minimumTrackTintColor = .systemBlue  // 滑轨左侧颜色
        slider.maximumTrackTintColor = .systemGray  // 滑轨右侧颜色
        slider.thumbTintColor = .systemBlue         // 滑块颜色
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        container.addSubview(slider)
        
        let valueLabel = UILabel()
        valueLabel.text = "当前值: \(Int(sliderValue))"
        valueLabel.font = UIFont.systemFont(ofSize: 14)
        valueLabel.textColor = .secondaryLabel
        valueLabel.tag = 100  // 设置 tag 以便后续获取
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            valueLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            
            slider.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 12),
            slider.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            slider.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            slider.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
        ])
        
        return container
    }
    
    // ==================== Stepper 步进器组件 ====================
    func createStepperSection() -> UIView {
        let container = createSectionContainer(title: "7. Stepper 步进器 (UIStepper)")
        
        let stepper = UIStepper()
        stepper.minimumValue = 0       // 最小值
        stepper.maximumValue = 100     // 最大值
        stepper.stepValue = 1          // 每次增减的值
        stepper.value = stepperValue   // 当前值
        stepper.wraps = true           // 是否循环（到达最大值后回到最小值）
        stepper.autorepeat = true      // 长按是否持续变化
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        container.addSubview(stepper)
        
        let valueLabel = UILabel()
        valueLabel.text = "数量: \(Int(stepperValue))"
        valueLabel.font = UIFont.systemFont(ofSize: 16)
        valueLabel.tag = 101
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            valueLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            valueLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
            
            stepper.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor),
            stepper.leadingAnchor.constraint(equalTo: valueLabel.trailingAnchor, constant: 16),
        ])
        
        return container
    }
    
    // ==================== Picker 选择器组件 ====================
    func createPickerSection() -> UIView {
        let container = createSectionContainer(title: "8. Picker 选择器 (UIPickerView)")
        
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(pickerView)
        
        let valueLabel = UILabel()
        valueLabel.text = "已选择: \(pickerData[0])"
        valueLabel.font = UIFont.systemFont(ofSize: 14)
        valueLabel.textColor = .secondaryLabel
        valueLabel.tag = 102
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            valueLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            
            pickerView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 12),
            pickerView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            pickerView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            pickerView.heightAnchor.constraint(equalToConstant: 120),
            pickerView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
        ])
        
        return container
    }
    
    // ==================== Progress 进度条组件 ====================
    func createProgressSection() -> UIView {
        let container = createSectionContainer(title: "9. Progress 进度条 (UIProgressView)")
        
        // 确定进度条
        let progressView1 = UIProgressView(progressViewStyle: .default)
        progressView1.progress = 0.7  // 进度值 (0.0 - 1.0)
        progressView1.progressTintColor = .systemBlue     // 已完成部分颜色
        progressView1.trackTintColor = .systemGray5       // 未完成部分颜色
        progressView1.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(progressView1)
        
        let label1 = UILabel()
        label1.text = "下载进度: 70%"
        label1.font = UIFont.systemFont(ofSize: 14)
        label1.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(label1)
        
        // 活动指示器（对应 SwiftUI 的进度动画）
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .systemBlue
        activityIndicator.startAnimating()  // 开始动画
        activityIndicator.hidesWhenStopped = true  // 停止时隐藏
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(activityIndicator)
        
        let label2 = UILabel()
        label2.text = "加载中..."
        label2.font = UIFont.systemFont(ofSize: 14)
        label2.textColor = .secondaryLabel
        label2.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(label2)
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            label1.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            
            progressView1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 8),
            progressView1.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            progressView1.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            label2.topAnchor.constraint(equalTo: progressView1.bottomAnchor, constant: 16),
            label2.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label2.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
            
            activityIndicator.centerYAnchor.constraint(equalTo: label2.centerYAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: label2.trailingAnchor, constant: 8),
        ])
        
        return container
    }
    
    // ==================== Alert 弹窗按钮 ====================
    func createAlertButtonSection() -> UIView {
        let container = createSectionContainer(title: "10. Alert 弹窗 (UIAlertController)")
        
        let alertButton = UIButton(type: .system)
        alertButton.setTitle("显示 Alert 弹窗", for: .normal)
        alertButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        alertButton.backgroundColor = .systemRed
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.layer.cornerRadius = 8
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.addTarget(self, action: #selector(showAlertButtonTapped), for: .touchUpInside)
        container.addSubview(alertButton)
        
        let actionSheetButton = UIButton(type: .system)
        actionSheetButton.setTitle("显示 ActionSheet", for: .normal)
        actionSheetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        actionSheetButton.backgroundColor = .systemOrange
        actionSheetButton.setTitleColor(.white, for: .normal)
        actionSheetButton.layer.cornerRadius = 8
        actionSheetButton.translatesAutoresizingMaskIntoConstraints = false
        actionSheetButton.addTarget(self, action: #selector(showActionSheetButtonTapped), for: .touchUpInside)
        container.addSubview(actionSheetButton)
        
        NSLayoutConstraint.activate([
            alertButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            alertButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            alertButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            alertButton.heightAnchor.constraint(equalToConstant: 44),
            
            actionSheetButton.topAnchor.constraint(equalTo: alertButton.bottomAnchor, constant: 12),
            actionSheetButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            actionSheetButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            actionSheetButton.heightAnchor.constraint(equalToConstant: 44),
            actionSheetButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
        ])
        
        return container
    }
    
    // MARK: - 辅助方法
    
    // 创建分节容器
    func createSectionContainer(title: String) -> UIView {
        let container = UIView()
        container.backgroundColor = .secondarySystemBackground
        container.layer.cornerRadius = 12
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
        ])
        
        return container
    }
    
    // MARK: - 事件处理方法
    
    @objc func buttonTapped(_ sender: UIButton) {
        print("按钮被点击了")
    }
    
    @objc func toggleValueChanged(_ sender: UISwitch) {
        print("开关状态: \(sender.isOn ? "开启" : "关闭")")
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        sliderValue = sender.value
        // 更新标签显示
        if let scrollView = view.subviews.first as? UIScrollView,
           let contentView = scrollView.subviews.first,
           let stackView = contentView.subviews.first as? UIStackView {
            for sectionView in stackView.arrangedSubviews {
                if let label = sectionView.viewWithTag(100) as? UILabel {
                    label.text = "当前值: \(Int(sender.value))"
                }
            }
        }
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
        stepperValue = sender.value
        // 更新标签显示
        if let scrollView = view.subviews.first as? UIScrollView,
           let contentView = scrollView.subviews.first,
           let stackView = contentView.subviews.first as? UIStackView {
            for sectionView in stackView.arrangedSubviews {
                if let label = sectionView.viewWithTag(101) as? UILabel {
                    label.text = "数量: \(Int(sender.value))"
                }
            }
        }
    }
    
    @objc func showAlertButtonTapped() {
        // 创建 Alert 弹窗
        let alert = UIAlertController(title: "提示", message: "这是一个 Alert 弹窗示例", preferredStyle: .alert)
        
        // 添加按钮
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { _ in
            print("点击了确定按钮")
        }))
        alert.addAction(UIAlertAction(title: "删除", style: .destructive, handler: { _ in
            print("点击了删除按钮")
        }))
        
        present(alert, animated: true)
    }
    
    @objc func showActionSheetButtonTapped() {
        // 创建 ActionSheet（操作表）
        let actionSheet = UIAlertController(title: "选择操作", message: "请选择以下选项之一", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "拍照", style: .default, handler: { _ in
            print("选择了拍照")
        }))
        actionSheet.addAction(UIAlertAction(title: "从相册选择", style: .default, handler: { _ in
            print("选择了从相册选择")
        }))
        actionSheet.addAction(UIAlertAction(title: "取消", style: .cancel))
        
        present(actionSheet, animated: true)
    }
}

// MARK: - UIPickerView 数据源和代理方法

extension ComponentsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // 返回选择器的列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 返回每列的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // 返回每行显示的标题
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // 当选中某一行时调用
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerIndex = row
        // 更新标签显示
        if let scrollView = view.subviews.first as? UIScrollView,
           let contentView = scrollView.subviews.first,
           let stackView = contentView.subviews.first as? UIStackView {
            for sectionView in stackView.arrangedSubviews {
                if let label = sectionView.viewWithTag(102) as? UILabel {
                    label.text = "已选择: \(pickerData[row])"
                }
            }
        }
    }
}
