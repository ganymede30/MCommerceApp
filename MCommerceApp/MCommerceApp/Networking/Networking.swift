import Foundation

protocol Networking {
  func dataTask(request: URLRequest, completion: ((Result<Data, Error>) -> Void)?)
}
