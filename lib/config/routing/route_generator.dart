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
          builder: (_) => BlocProvider(
            create: (context) => GetProductsCubit(
              productRepository: context.read<ProductRepository>(),
            ),
            child: const HomeScreen(),
          ),
        );
      case RouteNames.productDetailScreen:
        return MaterialPageRoute(builder: (_) => const ProductDetailScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
