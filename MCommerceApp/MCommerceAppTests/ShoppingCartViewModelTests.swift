import XCTest
import Combine
@testable import MCommerceApp

final class ShoppingCartViewModelTests: XCTestCase {
  private var cancellable = Set<AnyCancellable>()
  private let viewModel = ShoppingCartViewModel(
    networkingClient: FakeCartItemFetcher(),
    cacher: DiskCacheManager()
  )

  func testGetCartItemsLoadsItemsInCart() throws {
    viewModel.getCartItems()
    self.cancellable.insert(viewModel.$cartResponse.sink { response in
      XCTAssertFalse(response == nil)
    })
  }
  
  func testUpdateProductUpdatesProductInList() throws {
    viewModel.getCartItems()
    guard let firstProduct = viewModel.cartResponse?.products?.first else {
      XCTFail("Failed to load products")
      return
    }
    var updatedFirstProject = firstProduct
    updatedFirstProject.quantity = 10
    viewModel.updateProduct(updatedFirstProject)
    XCTAssertEqual(viewModel.cartResponse!.products!.first!.quantity, 10)
  }
}
