import UIKit

class PlanetsViewController: UIViewController {

    private let planetsView = PlanetsView()
    private var viewModel: PlanetVCViewModeling = PlanetVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        planetsView.collectionView.delegate = self
        planetsView.collectionView.dataSource = self
        bindViewModel()
        viewModel.loadInitialData()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    @objc func screenEdgeSwipedLeft(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            tabBarController?.selectedIndex = 0
        }
    }

    private func bindViewModel() {
        viewModel.onDataRecieved = { [weak self] in
            self?.planetsView.collectionView.reloadData()
        }
    }

    private func configureView() {
        self.view.backgroundColor = .white
        configurePlanetsViewConstraints()
        configureGestures()
    }

    private func configureGestures() {
        let edgePanLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwipedLeft))
        edgePanLeft.edges = .left
        view.addGestureRecognizer(edgePanLeft)
    }

    private func configurePlanetsViewConstraints() {
        view.addSubview(planetsView)
        planetsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            planetsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            planetsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            planetsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            planetsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}

// Mark: CollectionViewDelegate
extension PlanetsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.contentOffset.y < 0 ||
            collectionView.contentOffset.y > collectionView.contentSize.height - collectionView.frame.height {
            return
        }

        let dampingRatio: CGFloat = 0.8
        let initialVelocity: CGVector = CGVector.zero
        let springParameters: UISpringTimingParameters = UISpringTimingParameters(dampingRatio: dampingRatio, initialVelocity: initialVelocity)
        let animator = UIViewPropertyAnimator(duration: 0.5, timingParameters: springParameters)

        self.view.isUserInteractionEnabled = false

        if let selectedCell = viewModel.expandedCell {
            animator.addAnimations {
                selectedCell.collapse()

                for cell in self.viewModel.hiddenCells {
                    cell.show()
                }
            }

            animator.addCompletion { _ in
                collectionView.isScrollEnabled = true

                self.viewModel.expandedCell = nil
                self.viewModel.hiddenCells.removeAll()
            }
        } else {
            collectionView.isScrollEnabled = false

            let selectedCell = collectionView.cellForItem(at: indexPath)! as! PlanetCollectionViewCell
            let frameOfSelectedCell = selectedCell.frame

            viewModel.expandedCell = selectedCell
            viewModel.hiddenCells = collectionView.visibleCells.map { $0 as! PlanetCollectionViewCell }.filter { $0 != selectedCell }

            animator.addAnimations {
                selectedCell.expand(in: collectionView)

                for cell in self.viewModel.hiddenCells {
                    cell.hide(in: collectionView, frameOfSelectedCell: frameOfSelectedCell)
                }
            }
        }

        animator.addAnimations {
            self.setNeedsStatusBarAppearanceUpdate()
        }

        animator.addCompletion { _ in
            self.view.isUserInteractionEnabled = true
        }

        animator.startAnimation()
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.planetData.count - 2 {
            viewModel.fetchNewData()
        }
    }
}

extension PlanetsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.planetData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCollectionViewCell else { return UICollectionViewCell() }
        switch indexPath.row % 2 {
        case 0:
            cell.gradientView.gradientLayer?.colors = CGColor.greens
        case 1:
            cell.gradientView.gradientLayer?.colors = CGColor.purples
        default:
            break
        }
        let currentPlanet = viewModel.planetData[indexPath.row]
        cell.updateWith(planet: currentPlanet)
        return cell
    }
}

extension PlanetsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - (viewModel.cellSpacing * viewModel.numberOfSpaces)) / viewModel.numberOfCells
        let height: CGFloat = width * 0.66
        return CGSize(width: width , height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: viewModel.cellSpacing, left: viewModel.cellSpacing, bottom: viewModel.cellSpacing, right: viewModel.cellSpacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel.cellSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel.cellSpacing
    }
}
