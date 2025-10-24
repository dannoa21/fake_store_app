// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Fake Store';

  @override
  String get login => 'Login';

  @override
  String get welcomeBack => 'Welcome back! Glad to see you, Again!';

  @override
  String get enterUsernameHint => 'Enter your username';

  @override
  String get enterPasswordHint => 'Enter your password';

  @override
  String get welcome => 'Welcome';

  @override
  String get reviews => 'Reviews';

  @override
  String get price => 'Price';

  @override
  String get category => 'Category';

  @override
  String get cart => 'Cart';

  @override
  String get logOut => 'Log out';

  @override
  String get cartTotal => 'Cart total';

  @override
  String get checkout => 'Checkout';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get emptyFieldError => 'This field can not be empty.';
}
