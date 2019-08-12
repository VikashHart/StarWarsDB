import UIKit

class PlanetCollectionViewCell: ExpandableCell {

    private var viewModel: PlanetCellViewModeling?

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
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .center)
        label.text = "Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var rotationPeriodLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var orbitalPeriodLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var diameterLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var climateLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var gravityLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var terrainLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var surfaceWaterLabel: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 24, alignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var populationLabel: UILabel = {
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
            rotationPeriodLabel,
            orbitalPeriodLabel,
            diameterLabel,
            climateLabel,
            gravityLabel,
            terrainLabel,
            surfaceWaterLabel,
            populationLabel,
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

    func updateWith(planet: PlanetData) {
        viewModel = PlanetCellViewModel(planet: planet)
        nameLabel.text = viewModel?.name
        rotationPeriodLabel.text = viewModel?.rotationPeriod
        orbitalPeriodLabel.text = viewModel?.orbitalPeriod
        diameterLabel.text = viewModel?.diameter
        climateLabel.text = viewModel?.climate
        gravityLabel.text = viewModel?.gravity
        terrainLabel.text = viewModel?.terrain
        surfaceWaterLabel.text = viewModel?.surfaceWater
        populationLabel.text = viewModel?.population
        dataCreatedDateLabel.text = viewModel?.dataCreatedDate
    }
}
