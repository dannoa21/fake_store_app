part of 'index.dart';

/// Utility class for performing various validations in the application.
class ValidatorUtils {
  /// Validates if a given field is empty.
  ///
  /// - [value]: The input value to validate.
  /// - [context]: The build context for accessing localized strings.
  ///
  /// Returns an error message if the field is empty, otherwise returns null.
  static emptyFieldValidation({
    required String? value,
    required BuildContext context,
  }) {
    return (value == null || value.isEmpty)
        ? AppLocalizations.of(context)!.emptyFieldError
        : null;
  }

  /// Validates a user's name field.
  ///
  /// - [value]: The name input to validate.
  /// - [context]: The build context for accessing localized strings.
  ///
  /// Checks if the name is empty or if it contains more than two words.
  /// Returns an appropriate error message if validation fails, otherwise returns null.
  static validateName({required String? value, required BuildContext context}) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.emptyFieldError;
    }
    List<String> names = value.trim().split(' ');
    if (names.length > 2) {
      // TODO: add more validations
    }
    return null;
  }
}
