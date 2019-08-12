import Foundation

class StarWarsAPIClient {
    private let client: DataRetrieving
    private var nextPeopleURLString: String?
    private var nextPlanetsURLString: String?

    init(dataRetriever: DataRetrieving = NetworkClient()) {
        self.client = dataRetriever
    }

    func getPeople(completion: @escaping (Result<[PersonData], NetworkError>) -> Void) {
        getPeopleData(request: URLRequest(url: StarWarsEndpointBuilder.endpoint(.people)),
                      completion: completion)
    }

    func getNextPeople(completion: @escaping (Result<[PersonData], NetworkError>) -> Void) {
        guard let urlString = nextPeopleURLString,
            let url = URL(string: urlString)
            else {
                completion(.success([]))
                return
        }

        let request = URLRequest(url: url)
        getPeopleData(request: request, completion: completion)
    }

    private func getPeopleData(request: URLRequest,
                               completion: @escaping (Result<[PersonData], NetworkError>) -> Void) {
        client.get(request: request) { [weak self] (result) in
            switch result {
            case .success(let data):
                do {
                    let peopleModel = try JSONDecoder().decode(StarWarsPeopleModel.self, from: data)
                    self?.nextPeopleURLString = peopleModel.next
                    completion(.success(peopleModel.results))
                } catch {
                    completion(.failure(NetworkError.jsonDecoding(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getPlanets(completion: @escaping (Result<[PlanetData], NetworkError>) -> Void) {
        getPlanetsData(request: URLRequest(url: StarWarsEndpointBuilder.endpoint(.planets)), completion: completion)
    }

    func getNextPlanets(completion: @escaping (Result<[PlanetData], NetworkError>) -> Void) {
        guard let urlString = nextPlanetsURLString,
            let url = URL(string: urlString)
            else {
                completion(.success([]))
                return
        }

        let request = URLRequest(url: url)
        getPlanetsData(request: request, completion: completion)
    }

    private func getPlanetsData(request: URLRequest,
                                completion: @escaping (Result<[PlanetData], NetworkError>) -> Void) {
        client.get(request: request) { [weak self] (result) in
            switch result {
            case .success(let data):
                do {
                    let planetsModel = try JSONDecoder().decode(StarWarsPlanetModel.self, from: data)
                    self?.nextPlanetsURLString = planetsModel.next
                    completion(.success(planetsModel.results))
                } catch {
                    completion(.failure(NetworkError.jsonDecoding(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
