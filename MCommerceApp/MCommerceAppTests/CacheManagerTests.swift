import XCTest
@testable import MCommerceApp

final class CacheManagerTests: XCTestCase {

  private var response: CartResponse!
  private var cacheManager: DiskCacheManager!
  
  override func setUp() {
    do {
      guard let fileURL = Bundle.main.url(forResource: "CartResponse", withExtension: "json"),
            let jsonData = try? Data(contentsOf: fileURL) else {
        XCTFail("Conversion to data failed")
        return
      }
      response = try CartResponse(data: jsonData)
      cacheManager = DiskCacheManager()
    }
    catch {
      XCTFail("Invald JSON")
    }
  }
  
  override func tearDown() {
    cacheManager = nil
    response = nil
  }
  
  func testObjectCanBeCached() throws {
    XCTAssertNoThrow(try cacheManager.cache(objet: response))
  }
  
  func testCachedObjectCanBeReadBack() throws {
    do {
      try cacheManager.cache(objet: response)
      XCTAssertNoThrow(try cacheManager.read(), "Cached object does not persist")
    } catch {
      XCTFail("Object could not be stored in cache")
    }
  }
  
  func testMissCacheObjectThrowsException() throws {
     XCTAssertThrowsError(try self.cacheManager.read())
  }
  
  func testDeleteOperationDeletesObjectFromCache() throws {
    do {
      try cacheManager.cache(objet: response)
      XCTAssertNoThrow(try cacheManager.read())
      try cacheManager.delete()
      XCTAssertThrowsError(try cacheManager.read())
    }
    catch {
      XCTFail()
    }
  }
}
