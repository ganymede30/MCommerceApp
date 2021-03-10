import Foundation

struct Promo: Codable, Identifiable {
  var id: String { code + promoDescription }
  let code: String
  let promoDescription: String
  let value: String

  enum CodingKeys: String, CodingKey {
    case code
    case promoDescription = "description"
    case value
  }
}
