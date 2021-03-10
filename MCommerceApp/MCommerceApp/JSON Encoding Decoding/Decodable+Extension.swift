import Foundation

extension Decodable {
  init(data: Data) throws {
    self = try JSONDecoder().decode(Self.self, from: data)
  }
}
