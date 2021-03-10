import Foundation

protocol CartItemsFetchable {
  func getCartItems(completion: @escaping (Result<CartResponse, Error>) -> Void)
}
