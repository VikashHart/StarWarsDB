import UIKit

class PersonCollectionViewCell: ExpandableCell {

    var viewModel: PersonCellViewModeling?

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
        let label = UILabel.makeGillSansLabel(fontSize: 40, alignment: .center)
        label.textColor = .white
//        label.text = viewm
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
        let label = UILabel.makeGillSansLabel(fontSize: 28, alignment: .center)
        label.text = "Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var heightLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var weightLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var hairColorLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var firstHairColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var secondHairColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var skinColorLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var eyeColorLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "zsdcvghnk"
        return label
    }()

    lazy var firstEyeColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var secondEyeColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var birthYearLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var genderLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var dataCreatedDateLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
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
        scrollViewBottomConstraintToBottom?.isActive = false
        scrollViewBottomConstraintToTop?.isActive = true

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
        layoutVerticalViews()
        setupFirstHairColorView()
        setupSecondHairColorView()
        setupFirstEyeColorView()
        setupSecondEyeColorView()
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

    private func layoutVerticalViews() {
        let verticalViews = [
            heightLabel,
            weightLabel,
            hairColorLabel,
            skinColorLabel,
            eyeColorLabel,
            birthYearLabel,
            genderLabel,
            dataCreatedDateLabel
        ]
        var prevBottom = infoLabel.bottomAnchor
        for view in verticalViews {
            scrollViewContainer.addSubview(view)
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: prevBottom, constant: 20),
                view.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 20),
                view.trailingAnchor.constraint(lessThanOrEqualTo: scrollViewContainer.trailingAnchor, constant: -20),
                ])
            prevBottom = view.bottomAnchor
        }

        verticalViews.last?.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor, constant: -20).isActive = true
    }

    private func setupFirstHairColorView() {
        scrollViewContainer.addSubview(firstHairColorView)
        NSLayoutConstraint.activate([
            firstHairColorView.leadingAnchor.constraint(equalTo: hairColorLabel.trailingAnchor, constant: 10),
            firstHairColorView.centerYAnchor.constraint(equalTo: hairColorLabel.centerYAnchor),
            firstHairColorView.heightAnchor.constraint(equalToConstant: 40),
            firstHairColorView.widthAnchor.constraint(equalToConstant: 40)
            ])
    }

    private func setupSecondHairColorView() {
        scrollViewContainer.addSubview(secondHairColorView)
        NSLayoutConstraint.activate([
            secondHairColorView.leadingAnchor.constraint(equalTo: firstHairColorView.trailingAnchor, constant: 10),
            secondHairColorView.centerYAnchor.constraint(equalTo: hairColorLabel.centerYAnchor),
            secondHairColorView.heightAnchor.constraint(equalToConstant: 40),
            secondHairColorView.widthAnchor.constraint(equalToConstant: 40)
            ])
    }

    private func setupFirstEyeColorView() {
        scrollViewContainer.addSubview(firstEyeColorView)
        NSLayoutConstraint.activate([
            firstEyeColorView.leadingAnchor.constraint(equalTo: eyeColorLabel.trailingAnchor, constant: 20),
            firstEyeColorView.centerYAnchor.constraint(equalTo: eyeColorLabel.centerYAnchor),
            firstEyeColorView.heightAnchor.constraint(equalToConstant: 40),
            firstEyeColorView.widthAnchor.constraint(equalToConstant: 40)
            ])
    }

    private func setupSecondEyeColorView() {
        scrollViewContainer.addSubview(secondEyeColorView)
        NSLayoutConstraint.activate([
            secondEyeColorView.leadingAnchor.constraint(equalTo: firstEyeColorView.trailingAnchor, constant: 20),
            secondEyeColorView.centerYAnchor.constraint(equalTo: eyeColorLabel.centerYAnchor),
            secondEyeColorView.heightAnchor.constraint(equalToConstant: 40),
            secondEyeColorView.widthAnchor.constraint(equalToConstant: 40)
            ])
    }

    func updateWith(person: PersonData) {
        viewModel = PersonCellViewModel(person: person)
        nameLabel.text = viewModel?.name
        heightLabel.text = viewModel?.height
        weightLabel.text = viewModel?.weight
        hairColorLabel.text = viewModel?.hairColor
        firstHairColorView.backgroundColor = viewModel?.hairColorUIColorOne
        secondHairColorView.backgroundColor = viewModel?.hairColorUIColorTwo
        skinColorLabel.text = viewModel?.skinColor
        eyeColorLabel.text = viewModel?.eyeColor
        firstEyeColorView.backgroundColor = viewModel?.eyeColorUIColorOne
        secondEyeColorView.backgroundColor = viewModel?.eyeColorUIColorTwo
        birthYearLabel.text = viewModel?.birthYear
        genderLabel.text = viewModel?.gender
        dataCreatedDateLabel.text = viewModel?.dataCreatedDate
    }
}
