import Foundation

protocol CachingStrategy {
  func cache(objet: Encodable) throws
  func read() throws -> Data
  func delete() throws
}

/// persist objects conforming to the Encodable protocol on the disk. Creates data from the object and writes it to the disk
struct DiskCacheManager: CachingStrategy {
  private let cacheFileName: String

  init(key: String = "shopping-cart-response-data") {
    self.cacheFileName = key
  }

  /// stores the Encodable instance into the cache. Throws an exception if the item cannot be cached
  /// - Parameter objet: an object conforming to the Encodable protocol
  func cache(objet: Encodable) throws {
    let fileURL = Paths.getFilePathInCacheDirectory(fileName: cacheFileName)
    let data = try objet.jsonData()
    try data.write(
      to: fileURL,
      options: .atomicWrite
    )
  }

  /// Reads data from the cache, throws an exception if the data cannot be read
  /// - Returns: binary data of the cached file.
  func read() throws -> Data {
    let fileURL = Paths.getFilePathInCacheDirectory(fileName: cacheFileName)
    return try Data(contentsOf: fileURL)
  }

  /// deletes data from the cache, throws an exception if the cached item cannot be deleted
  func delete() throws {
    let fileURL = Paths.getFilePathInCacheDirectory(fileName: cacheFileName)
    try FileManager.default.removeItem(at: fileURL)
  }
}
