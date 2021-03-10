import Foundation

/// To build URL request based on the HTTP method and the endpoint.
/// This is not being used as I'm loading the data from the bundled JSON file, because the URL is not working
struct URLRequestBuilder {
  private init() {}

  /// creates and returns at the URL request for the given endpoint, body and type of request
  /// - Parameters:
  ///   - endpoint: an API endpoint
  ///   - method: HTTP method
  ///   - queryItems: query parameters to be passed in the URL
  ///   - body: an optional request body in case of POST or PUT request
  /// - Returns: URL request based on the data provided.
  static func buildRequest(
    endpoint: Endpoints,
    method: HTTPMethods,
    queryItems: [URLQueryItem]? = nil,
    body: Any? = nil
  ) -> URLRequest {
    var req = URLRequest(
      url: URLComponents.buildURL(
        endpoint: endpoint,
        queryItems: queryItems
      )
    )

    if let requestBody = body {
      req.httpBody = try? JSONSerialization.data(
        withJSONObject: requestBody,
        options: .prettyPrinted
      )
    }

    req.httpMethod = method.rawValue
    return req
  }
}
