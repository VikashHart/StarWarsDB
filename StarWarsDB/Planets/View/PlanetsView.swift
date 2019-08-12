import UIKit

class PlanetsView: UIView {

    lazy var headerGradient: GradientView = {
        let view = GradientView()
        view.gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        view.gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        view.gradientLayer?.colors = CGColor.blacks
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var headerTitle: UILabel = {
        let label = UILabel.makeGillSansLabel(fontSize: 40, alignment: .center)
        label.text = "Planets"
        label.textColor = .white
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let cell = "PlanetCell"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(PlanetCollectionViewCell.self, forCellWithReuseIdentifier: cell)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }

    private func setupViews() {
        setupHeaderGradient()
        setupHeaderTitle()
        setupCollectionView()
    }

    private func setupHeaderGradient() {
        addSubview(headerGradient)
        NSLayoutConstraint.activate([
            headerGradient.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerGradient.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerGradient.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerGradient.heightAnchor.constraint(equalToConstant: 50)
            ])
    }

    private func setupHeaderTitle() {
        headerGradient.addSubview(headerTitle)
        NSLayoutConstraint.activate([
            headerTitle.centerXAnchor.constraint(equalTo: headerGradient.centerXAnchor),
            headerTitle.centerYAnchor.constraint(equalTo: headerGradient.centerYAnchor)
            ])
    }
    private func setupCollectionView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerGradient.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
