import Foundation

struct CartResponse: Codable {
  var products: [Product]?
  let promos: [Promo]?
  let summary: CartSummary

  enum CodingKeys: String, CodingKey {
    case products
    case promos
    case summary
  }
}
