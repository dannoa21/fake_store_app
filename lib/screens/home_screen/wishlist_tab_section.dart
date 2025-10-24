part of 'index.dart';

class WishlistTabSection extends StatelessWidget {
  const WishlistTabSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = mockProducts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product list
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[0];
              return WishlistItemCard(
                product: product,
                onAddToCart: () {
                  // TODO: Implement add to cart functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.title} added to cart'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
