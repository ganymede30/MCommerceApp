import Foundation

extension Encodable {
  func jsonData() throws -> Data {
    try JSONEncoder().encode(self)
  }
}
