part of 'index.dart';

class CartTabSection extends StatelessWidget {
  const CartTabSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    final products = mockProducts;

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        final product = products[0];
        return Dismissible(
          key: ValueKey(product.id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              // Handle the dismiss action (e.g., remove item from wishlist)
              products.removeAt(index);
              // Then show a snackbar.
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Item removed from cart')));
            }
          },
          child: CartItemCard(
            image: product.image,
            title: product.title,
            price: 100,
          ),
        );
      },
    );
  }
}
