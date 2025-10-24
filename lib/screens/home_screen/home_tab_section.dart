part of 'index.dart';

class HomeTabSection extends StatelessWidget {
  const HomeTabSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetProductsFailure) {
          return Center(
            child: Text(
              "Something went wrong! We couldn't fetch products. Try again with the button below.", //add button to retry
            ),
          );
        }
        if (state is GetProductsSuccess) {
          final products = state.products;
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
                    final product = products[index];
                    return ProductItemCard(
                      product: product,
                    );
                  },
                ),
              ),
            ],
          );
        }
        return SizedBox.shrink(); //TODO: revisit this
      },
    );
  }
}
