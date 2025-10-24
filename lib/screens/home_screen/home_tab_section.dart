part of 'index.dart';

class HomeTabSection extends StatelessWidget {
  const HomeTabSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    final products = mockProducts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.appTitle,
          style: textTheme.headlineLarge,
        ),
        kVerticalSpace16,
        // Product list
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[0];
              return ProductItemCard(
                product: product,
              );
            },
          ),
        ),
      ],
    );
  }
}
