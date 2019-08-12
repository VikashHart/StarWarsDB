import UIKit

class PersonCollectionViewCell: ExpandableCell {

    var scrollViewBottomConstraintToBottom: NSLayoutConstraint?
    var scrollViewBottomConstraintToTop: NSLayoutConstraint?

    lazy var gradientView: GradientView = {
        let view = GradientView()
        view.gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        view.gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 40)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .clear
        sv.delaysContentTouches = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var scrollViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var hairColorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var hairColorGradient: GradientView = {
        let view = GradientView()
        view.gradientLayer?.startPoint = CGPoint(x: 0, y: 0.5)
        view.gradientLayer?.endPoint = CGPoint(x: 1, y: 0.5)
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var skinColorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var eyeColorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var eyeColorGradient: GradientView = {
        let view = GradientView()
        view.gradientLayer?.startPoint = CGPoint(x: 0, y: 0.5)
        view.gradientLayer?.endPoint = CGPoint(x: 1, y: 0.5)
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var birthYearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var dataCreatedDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = UIColor.white
        setupViews()
    }

    override func expand(in collectionView: UICollectionView) {
        scrollViewBottomConstraintToTop?.isActive = false
        scrollViewBottomConstraintToBottom?.isActive = true

        super.expand(in: collectionView)
    }

    override func collapse() {
        scrollViewBottomConstraintToTop?.isActive = true
        scrollViewBottomConstraintToBottom?.isActive = false

        super.collapse()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func setupViews() {
        setupGradientView()
        setupNameLabel()
        setupScrollView()
        setupContainerView()
        setupInfoLabel()
        setupHeightLabel()
        setupWeightLabel()
        setupHairColorLabel()
        setupHairColorGradient()
        setupSkinColorLabel()
        setupEyeColorLabel()
        setupEyeColorGradient()
        setupBirthYearLabel()
        setupGenderLabel()
        setupDataCreatedDateLabel()
    }

    // All Constraints Go Here.
    private func setupGradientView() {
        addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: contentView.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gradientView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.66)
            ])
    }

    private func setupNameLabel() {
        gradientView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor, constant: -20),
            nameLabel.centerYAnchor.constraint(equalTo: gradientView.centerYAnchor)
            ])
    }

    private func setupScrollView() {
        addSubview(scrollView)

        scrollViewBottomConstraintToBottom = scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        scrollViewBottomConstraintToTop = scrollView.bottomAnchor.constraint(equalTo: scrollView.topAnchor)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: gradientView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        scrollViewBottomConstraintToTop?.isActive = true
    }

    private func setupContainerView() {
        scrollView.addSubview(scrollViewContainer)
        NSLayoutConstraint.activate([
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor),
            scrollViewContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            ])
    }

    private func setupInfoLabel() {
        scrollViewContainer.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -20),
            infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }

    private func setupHeightLabel() {
        scrollViewContainer.addSubview(heightLabel)
        NSLayoutConstraint.activate([
            heightLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            heightLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20),
            heightLabel.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -20)
            ])
    }

    private func setupWeightLabel() {
        scrollViewContainer.addSubview(weightLabel)
        NSLayoutConstraint.activate([
            weightLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20),
            weightLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20),
            weightLabel.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -20)
            ])
    }

    private func setupHairColorLabel() {
        scrollViewContainer.addSubview(hairColorLabel)
        NSLayoutConstraint.activate([
            hairColorLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20),
            hairColorLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20)
            ])
    }

    private func setupHairColorGradient() {
        scrollViewContainer.addSubview(hairColorGradient)
        NSLayoutConstraint.activate([
            hairColorGradient.leadingAnchor.constraint(equalTo: hairColorLabel.trailingAnchor, constant: 30),
            hairColorGradient.centerYAnchor.constraint(equalTo: hairColorLabel.centerYAnchor),
            hairColorGradient.heightAnchor.constraint(equalToConstant: 40),
            hairColorGradient.widthAnchor.constraint(equalToConstant: 40)
            ])
    }

    private func setupSkinColorLabel() {
        scrollViewContainer.addSubview(skinColorLabel)
        NSLayoutConstraint.activate([
            skinColorLabel.topAnchor.constraint(equalTo: hairColorLabel.bottomAnchor, constant: 20),
            skinColorLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20),
            skinColorLabel.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -20)
            ])
    }

    private func setupEyeColorLabel() {
        scrollViewContainer.addSubview(eyeColorLabel)
        NSLayoutConstraint.activate([
            eyeColorLabel.topAnchor.constraint(equalTo: skinColorLabel.bottomAnchor, constant: 20),
            eyeColorLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20)
            ])
    }

    private func setupEyeColorGradient() {
        scrollViewContainer.addSubview(eyeColorGradient)
        NSLayoutConstraint.activate([
            eyeColorGradient.leadingAnchor.constraint(equalTo: eyeColorLabel.trailingAnchor, constant: 30),
            eyeColorGradient.centerYAnchor.constraint(equalTo: eyeColorLabel.centerYAnchor),
            eyeColorGradient.heightAnchor.constraint(equalToConstant: 40),
            eyeColorGradient.widthAnchor.constraint(equalToConstant: 40)
            ])
    }

    private func setupBirthYearLabel() {
        scrollViewContainer.addSubview(birthYearLabel)
        NSLayoutConstraint.activate([
            birthYearLabel.topAnchor.constraint(equalTo: eyeColorLabel.bottomAnchor, constant: 20),
            birthYearLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20),
            birthYearLabel.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -20),
            ])
    }

    private func setupGenderLabel() {
        scrollViewContainer.addSubview(genderLabel)
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: birthYearLabel.bottomAnchor, constant: 20),
            genderLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20),
            genderLabel.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -20),
            ])
    }

    private func setupDataCreatedDateLabel() {
        scrollViewContainer.addSubview(dataCreatedDateLabel)
        NSLayoutConstraint.activate([
            dataCreatedDateLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 20),
            dataCreatedDateLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20),
            dataCreatedDateLabel.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -20),
            dataCreatedDateLabel.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor)
            ])
    }
}
