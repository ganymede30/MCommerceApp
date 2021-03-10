import Foundation

/// Fetches items in the cart
struct CartItemsFetcher: CartItemsFetchable {
  private let networking: Networking
  init(client: Networking = NetworkingClient()) {
    self.networking = client
  }

  func getCartItems(completion: @escaping (Result<CartResponse, Error>) -> Void) {
    guard let fileURL = Bundle.main.url(forResource: "CartResponse", withExtension: "json"),
      let jsonData = try? Data(contentsOf: fileURL), let cartResponse = try? CartResponse(data: jsonData) else {
      completion(.failure(NSError()))
      return
    }
    completion(.success(cartResponse))
  }
}
