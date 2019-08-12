import UIKit

protocol PlanetVCViewModeling {
    var cellSpacing: CGFloat { get }
    var numberOfCells: CGFloat { get }
    var numberOfSpaces: CGFloat { get }
    var planetData: [PlanetData] { get }
    var hiddenCells: [PlanetCollectionViewCell] { get set }
    var expandedCell: PlanetCollectionViewCell? { get set }
    var onDataRecieved: (() -> Void)? { get set }

    func loadInitialData()
    func fetchNewData()
}

class PlanetVCViewModel: PlanetVCViewModeling {
    let cellSpacing: CGFloat
    var numberOfCells: CGFloat
    let numberOfSpaces: CGFloat
    private(set) var planetData: [PlanetData] = [] {
        didSet {
            DispatchQueue.main.async {
                self.onDataRecieved?()
            }
        }
    }
    private let apiClient: PlanetsRetrievable

    var hiddenCells: [PlanetCollectionViewCell] = []
    var expandedCell: PlanetCollectionViewCell?
    var onDataRecieved: (() -> Void)?

    init(cellSpacing: CGFloat = 10, numberOfCells: CGFloat = 1, apiClient: PlanetsRetrievable = StarWarsAPIClient()) {
        self.cellSpacing = cellSpacing
        self.numberOfCells = numberOfCells
        self.numberOfSpaces = numberOfCells + 1
        self.apiClient = apiClient
    }

    func loadInitialData() {
        apiClient.getPlanets(completion: { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.planetData = data
            case .failure(let error):
                print(error)
            }
        })
    }

    func fetchNewData() {
        apiClient.getNextPlanets { [weak self] (result) in
            switch result {
            case .success(let data):
                if let existingData = self?.planetData {
                    self?.planetData = existingData + data
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
