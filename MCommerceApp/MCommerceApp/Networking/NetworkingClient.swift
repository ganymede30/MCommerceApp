import Foundation

struct NetworkingClient: Networking {
  private let session: URLSession

  init(session: URLSession = .shared) {
    self.session = session
  }

  func dataTask(request: URLRequest, completion: ((Result<Data, Error>) -> Void)?) {
    session.dataTask(with: request) { data, _, error in
      DispatchQueue.main.async {
        if let err = error {
          completion?(.failure(err))
        } else if let responseData = data {
          completion?(.success(responseData))
        }
      }
    }
    .resume()
  }
}
