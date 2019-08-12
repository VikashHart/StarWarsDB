import UIKit

class PeopleViewController: UIViewController {

    private let peopleView = PeopleView()
    private var viewModel: PeopleVCViewModeling = PeopleVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        peopleView.collectionView.delegate = self
        peopleView.collectionView.dataSource = self
        bindViewModel()
        viewModel.loadInitialData()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    @objc func screenEdgeSwipedRight(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            tabBarController?.selectedIndex = 1
        }
    }

    private func bindViewModel() {
        viewModel.onDataRecieved = { [weak self] in
            self?.peopleView.collectionView.reloadData()
        }
    }

    private func configureView() {
        self.view.backgroundColor = .white
        configurePeopleViewConstraints()
        configureGestures()
    }

    private func configureGestures() {
        let edgePanRight = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwipedRight))
        edgePanRight.edges = .right
        view.addGestureRecognizer(edgePanRight)
    }

    private func configurePeopleViewConstraints() {
        view.addSubview(peopleView)
        peopleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            peopleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            peopleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            peopleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            peopleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}

// Mark: CollectionViewDelegate
extension PeopleViewController: UICollectionViewDelegate {

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

            let selectedCell = collectionView.cellForItem(at: indexPath)! as! PersonCollectionViewCell
            let frameOfSelectedCell = selectedCell.frame

            viewModel.expandedCell = selectedCell
            viewModel.hiddenCells = collectionView.visibleCells.map { $0 as! PersonCollectionViewCell }.filter { $0 != selectedCell }

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
        if indexPath.row == viewModel.peopleData.count - 2 {
            viewModel.fetchNewData()
        }
    }
}

extension PeopleViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.peopleData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as? PersonCollectionViewCell else { return UICollectionViewCell() }
        switch indexPath.row % 2 {
        case 0:
            cell.gradientView.gradientLayer?.colors = CGColor.blues
        case 1:
            cell.gradientView.gradientLayer?.colors = CGColor.reds
        default:
            break
        }
        let currentPerson = viewModel.peopleData[indexPath.row]
            cell.updateWith(person: currentPerson)
        return cell
    }
}

extension PeopleViewController: UICollectionViewDelegateFlowLayout {

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
