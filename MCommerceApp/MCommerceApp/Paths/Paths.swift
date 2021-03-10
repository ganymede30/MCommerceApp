import Foundation

/// Paths for different file system directories
struct Paths {
  private init() {}
  
  /// returns cache directory path
  /// - Returns: URL of cache directory
  static func getCacheDirectoryPath() -> URL {
    let arrayPaths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
    let cacheDirectory = arrayPaths[0]
    return cacheDirectory
  }
  
  /// file path in caches directory
  /// - Parameter fileName: name of the file
  /// - Returns: returns complete path of the file in cache directory
  static func getFilePathInCacheDirectory(fileName: String) -> URL {
    let arrayPaths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
    let filePathInCacheDirectory = arrayPaths[0].appendingPathComponent(fileName)
    return filePathInCacheDirectory
  }
}
