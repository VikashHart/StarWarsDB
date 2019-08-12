import UIKit

protocol PeopleVCViewModeling {
    var cellSpacing: CGFloat { get }
    var numberOfCells: CGFloat { get }
    var numberOfSpaces: CGFloat { get }
    var peopleData: [PersonData] { get }
    var hiddenCells: [PersonCollectionViewCell] { get set }
    var expandedCell: PersonCollectionViewCell? { get set }
    var onDataRecieved: (() -> Void)? { get set }

    func loadInitialData()
    func fetchNewData()
}

class PeopleVCViewModel: PeopleVCViewModeling {
    let cellSpacing: CGFloat
    var numberOfCells: CGFloat
    let numberOfSpaces: CGFloat
    private(set) var peopleData: [PersonData] = [] {
        didSet {
            DispatchQueue.main.async {
                self.onDataRecieved?()
            }
        }
    }
    private let apiClient: StarWarsAPIClient

    var hiddenCells: [PersonCollectionViewCell] = []
    var expandedCell: PersonCollectionViewCell?
    var onDataRecieved: (() -> Void)?

    init(cellSpacing: CGFloat = 10, numberOfCells: CGFloat = 1, apiClient: StarWarsAPIClient = StarWarsAPIClient()) {
        self.cellSpacing = cellSpacing
        self.numberOfCells = numberOfCells
        self.numberOfSpaces = numberOfCells + 1
        self.apiClient = apiClient
    }

    func loadInitialData() {
        apiClient.getPeople(completion: { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.peopleData = data
            case .failure(let error):
                print(error)
            }
        })
    }

    func fetchNewData() {
        apiClient.getNextPeople { [weak self] (result) in
            switch result {
            case .success(let data):
                if let existingData = self?.peopleData {
                self?.peopleData = existingData + data
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
