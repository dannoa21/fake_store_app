part of 'index.dart';

class ProductDetailScreenArguments {
  ProductDetailScreenArguments({
    required this.productId,
  });
  final int productId;
}

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.productId,
  });
  final int productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetProductDetailCubit>().execute(productId: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xFFF8F7FA),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<GetProductDetailCubit, GetProductDetailState>(
            builder: (context, state) {
              if (state is GetProductDetailLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetProductDetailFailure) {
                return Center(
                  child: Text(
                    "Something happened! Try again.", // TODO: add button to retry
                    style: textTheme.bodyLarge,
                  ),
                );
              }
              if (state is! GetProductDetailSuccess) {
                return SizedBox.shrink(); //revisit
              }

              final product = state.product;
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            kVerticalSpace12,
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  BackButton(
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            kVerticalSpace32,
                            AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                product.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildProductInfoSection(
                        context: context,
                        product: product,
                      ),
                      _buildProductPricingSection(
                        context: context,
                        product: product,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgIcon(
                        iconName: "back",
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProductPricingSection({
    required BuildContext context,
    required Product product,
  }) {
    final t = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: textTheme.labelMedium?.copyWith(
                  color: textTheme.labelMedium?.color?.withOpacity(0.7),
                ),
              ),
              Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textTheme.bodyLarge?.color?.withOpacity(0.7),
                ),
              ),
              kVerticalSpace12,
            ],
          ),
          kHorizontalSpace12,
          context.read<CartCubit>().isInCart(product)
              ? Text(
                  "In Cart", // todo: ask design to maybe redirect to cart screen or sth
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                )
              : Expanded(
                  child: SizedBox(
                    height: 48,
                    child: CustomButton(
                      buttonText: t.addToCart,
                      onPressed: () {
                        context.read<CartCubit>().addToCart(
                          product: product,
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildProductInfoSection({
    required BuildContext context,
    required Product product,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: textTheme.headlineLarge,
          ),
          Text(
            product.category,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: textTheme.bodyMedium?.color?.withOpacity(0.7),
            ),
          ),
          kVerticalSpace8,
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.black,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                product.rating.rate.toString(),
                style: textTheme.bodySmall,
              ),
              const SizedBox(width: 12),
              Text(
                "12 Reviews",
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          kVerticalSpace12,
        ],
      ),
    );
  }
}
