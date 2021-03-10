import Foundation

struct Product: Codable, Identifiable {
  var id: String { sku }

  let sku: String
  let displayName: String
  let price: String
  var quantity: Int

  enum CodingKeys: String, CodingKey {
    case sku
    case displayName
    case price
    case quantity
  }
}
