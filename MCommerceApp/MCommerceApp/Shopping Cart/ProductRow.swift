import SwiftUI

struct ProductRow: View {
  let product: Product
  let onQuantityChanged: (Int) -> Void

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(product.displayName)
          .font(.headline)
        Spacer()
        HStack {
          stepper()
        }
      }
      Text("$\(product.price)")
        .font(.subheadline)
      Text("Quantity: \(product.quantity)")
        .font(.subheadline)
        .padding(.top, 2)
    }
    .padding([.leading, .trailing], 0.0)
  }
}

fileprivate extension ProductRow {
  func stepper() -> some View {
    Stepper("", onIncrement: {
      onQuantityChanged(product.quantity + 1)
    }, onDecrement: {
      onQuantityChanged(max(1, product.quantity - 1))
    })
  }
}

#if DEBUG
struct ProductRow_Previews: PreviewProvider {
  static let dummyProduct = Product(
    sku: "123",
    displayName: "Awesome shoes",
    price: "$54.99",
    quantity: 10
  )
  static var previews: some View {
    Group {
      ProductRow(product: dummyProduct, onQuantityChanged: { _ in

      })
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
      ProductRow(product: dummyProduct, onQuantityChanged: { _ in

      })
        .previewLayout(.sizeThatFits)
    }
  }
}
#endif
