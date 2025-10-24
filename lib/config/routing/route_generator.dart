part of '../index.dart';

/// This class centralizes route generation logic in the application.
class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.introScreen:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.productDetailScreen:
        return MaterialPageRoute(builder: (_) => const ProductDetailScreen());

      default:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
    }
  }
}
