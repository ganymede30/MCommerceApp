import Foundation
@testable import MCommerceApp

struct FakeCartItemFetcher: CartItemsFetchable {
  func getCartItems(completion: @escaping (Result<CartResponse, Error>) -> Void) {
    guard let fileURL = Bundle.main.url(forResource: "CartResponse", withExtension: "json"),
          let jsonData = try? Data(contentsOf: fileURL), let response = try? CartResponse(data: jsonData) else {
      completion(.failure(NSError()))
      return
    }
    completion(.success(response))
  }
}
