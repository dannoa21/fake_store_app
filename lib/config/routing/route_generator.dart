part of '../index.dart';

/// This class centralizes route generation logic in the application.
class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.introScreen:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LoginDataCubit(),
              ),
              BlocProvider(
                create: (context) => LoginCubit(
                  authRepository: context.read<AuthRepository>(),
                ),
              ),
            ],
            child: const LoginScreen(),
          ),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RouteNames.productDetailScreen:
        final args = settings.arguments as ProductDetailScreenArguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GetProductDetailCubit(
              productRepository: context.read<ProductRepository>(),
            ),
            child: ProductDetailScreen(
              productId: args.productId,
            ),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
