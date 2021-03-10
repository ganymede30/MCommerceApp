import Foundation

final class ShoppingCartViewModel: ObservableObject {
  @Published var cartResponse: CartResponse?

  private let networking: CartItemsFetchable
  private let cacher: CachingStrategy?

  init(
    networkingClient: CartItemsFetchable = CartItemsFetcher(),
    cacher: CachingStrategy? = nil
  ) {
    networking = networkingClient
    self.cacher = cacher
  }

  /// Call the API to get items in the cart. Tries to read the data from the cache
  func getCartItems() {
    do {
      // if the cache manager is not provided then called API
      guard let cacheManger = cacher else {
        loadItemsInCart()
        return
      }
      let data = try cacheManger.read()
      cartResponse = try CartResponse(data: data)
    } catch {
      // if something goes wrong in reading data from the cache, then called the API.
      loadItemsInCart()
    }
  }

  private func loadItemsInCart() {
    networking.getCartItems { [weak self] result in
      guard let self = self else { return }
      do {
        switch result {
        case .success(let cartResponse):
          self.cartResponse = cartResponse
          try self.cacher?.cache(objet: cartResponse)

        case .failure(let error):
          print(error)
        }
      } catch let err {
        print(err)
      }
    }
  }
}

// MARK: -

extension ShoppingCartViewModel {
  /// Finds the product in the list and replaces it with the new product
  /// - Parameter product: Product with updated information
  func updateProduct(_ product: Product) {
    // Find the product index which we need to update with the SKU number
    let index = cartResponse?.products?.firstIndex { productInCart in
      productInCart.sku == product.sku
    }
    guard let idx = index else { return }
    cartResponse?.products?[idx] = product
  }
}
