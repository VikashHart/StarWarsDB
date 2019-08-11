import UIKit

class PeopleView: UIView {

   lazy var headerGradient: GradientView = {
        let view = GradientView()
        view.gradientLayer?.startPoint = CGPoint(x: 0, y: 0.5)
        view.gradientLayer?.endPoint = CGPoint(x: 1, y: 0.5)
        view.gradientLayer?.colors = CGColor.blacks
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "People"
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor.starWars
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let cell = "PersonCell"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: cell)
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
            headerGradient.heightAnchor.constraint(equalToConstant: 44)
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
