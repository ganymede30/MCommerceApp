import Foundation

/// Utility methods to create URLs.
/// Currently this is not being used because no actual API is being called in the application
extension URLComponents {
  /// creates URL components with the default configuration.
  /// - Parameter endpoint: API Endpoint
  /// - Returns: URLComponents instance with host, path and scheme
  private static func defaultConfiguration(endpoint: Endpoints) -> Self {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "www.dsw.com/api/v1"
    components.path = endpoint.rawValue
    return components
  }

  /// creates URL for the Endpoint and query items
  /// - Parameters:
  ///   - endpoint: API Endpoint
  ///   - queryItems: URL quality parameters
  /// - Returns: complete URL
  static func buildURL(endpoint: Endpoints, queryItems: [URLQueryItem]?) -> URL {
    var components: URLComponents = .defaultConfiguration(endpoint: endpoint)
    components.queryItems = queryItems
    let urlString = (components.scheme ?? "") + "://" + (components.host ?? "") + components.path
    guard let url = URL(string: urlString) else {
      fatalError("Coud not construct URL")
    }
    return url
  }
}
