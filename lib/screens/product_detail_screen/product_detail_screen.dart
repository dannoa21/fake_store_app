part of 'index.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color(0xFFF8F7FA),
      body: SafeArea(
        child: Center(
          child: Column(
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
                    Image.asset(
                      "assets/images/login_background.jpg",
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: 420,
                    ),
                  ],
                ),
              ),
              kVerticalSpace32,
              _buildProductInfoSection(context),
              _buildProductPricingSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductPricingSection(BuildContext context) {
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
                "\$79.99",
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textTheme.bodyLarge?.color?.withOpacity(0.7),
                ),
              ),
              kVerticalSpace12,
            ],
          ),
          kHorizontalSpace12,
          Expanded(
            child: SizedBox(
              height: 48,
              child: CustomButton(
                buttonText: t.addToCart,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductInfoSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Xbox One Elite Series 2 Controller",
            style: textTheme.headlineLarge,
          ),
          Text(
            "Gaming category",
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
                "4.25",
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
