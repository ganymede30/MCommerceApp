import Foundation

struct CartSummary: Codable {
  let subtotal: String
  let tax: String
  let discounts: String
  let total: String

  enum CodingKeys: String, CodingKey {
    case subtotal
    case tax
    case discounts
    case total
  }
}
