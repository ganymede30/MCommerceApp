import SwiftUI

struct ShoppingCartView: View {
  @ObservedObject var viewModel: ShoppingCartViewModel

  var body: some View {
    VStack {
      // render the items in the list if the response is not nil and the product array is also not nil
      if viewModel.cartResponse != nil && viewModel.cartResponse!.promos != nil {
        List {
          Section(
            header: Text("Items in the cart"),
            footer: promos(viewModel.cartResponse!.promos ?? [])
          ) {
            ForEach((0..<viewModel.cartResponse!.products!.count)) { index in
              ProductRow(product: viewModel.cartResponse!.products![index], onQuantityChanged: { newQuantity in
                var updatedProduct = viewModel.cartResponse!.products![index]
                updatedProduct.quantity = newQuantity
                viewModel.updateProduct(updatedProduct)
              })
                .buttonStyle(PlainButtonStyle())
            }
          }
        }
      } else {
        Text("Loading...")
          .padding()
      }
    }
    .onAppear {
      viewModel.getCartItems()
    }
  }
}

fileprivate extension ShoppingCartView {
  func promos(_ promos: [Promo]) -> some View {
    VStack(alignment: .leading) {
      ForEach((0..<promos.count), id: \.self) { index in
        Text("PROMOS").font(.headline)
        Text("\(promos[index].code)").font(.headline)
        Text("\(promos[index].promoDescription), \(promos[index].value))").font(.subheadline)
      }
    }
  }
}

#if DEBUG
struct ShoppingCartView_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingCartView(viewModel: ShoppingCartViewModel())
  }
}
#endif
