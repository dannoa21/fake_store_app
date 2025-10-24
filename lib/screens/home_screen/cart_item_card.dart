part of 'index.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartItemCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        final cartItem = cartState.cart.firstWhere(
          (item) => item.product.id == product.id,
        );
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),

              // Product title + quantity control
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _QuantityButton(
                            iconName: "minus-circle",
                            onPressed: () {
                              context.read<CartCubit>().updateQuantity(
                                product.id,
                                cartItem.quantity - 1,
                              );
                            },
                          ),
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: Text(
                              quantity.toString(),
                              style: textTheme.titleMedium,
                            ),
                          ),
                          _QuantityButton(
                            iconName: "plus-circle",
                            onPressed: () {
                              context.read<CartCubit>().updateQuantity(
                                product.id,
                                cartItem.quantity + 1,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Price
              Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final String iconName;
  final VoidCallback onPressed;

  const _QuantityButton({
    required this.iconName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SvgIcon(
          iconName: iconName,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
