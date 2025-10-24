# Fake Store App

A modern Flutter e-commerce application built with clean architecture principles, featuring user authentication, product browsing, cart management, and wishlist functionality. Currently implemented only the basic functionalities. Hopefully will implement more features soon

## 🚀 Features

### Core Features
- **User Authentication** - Login with JWT token management ~ *** could be improved
- **Product Catalog** - Browse products with images, prices, and ratings
- **Product Details** - Detailed product information with full descriptions
- **Shopping Cart** - Add/remove products with quantity management
- **Wishlist** - Save favorite products locally (in memory only as of now)

### Technical Features
- **State Management** - BLoC pattern for predictable state management
- **API Integration** - RESTful API calls using Dio
- **Local Storage** - SharedPreferences for persistent data
- **Internationalization** - Multi-language support (English/Spanish)
- **Clean Architecture** - Repository pattern with manual dependency injection (using BlocProvider/RepositoryProvider) -- aiming to use get It soon
- **Error Handling** - Comprehensive error handling and user feedback

## 🛠 Tech Stack

- **Framework**: Flutter 3.9.2+
- **State Management**: BLoC (flutter_bloc)
- **HTTP Client**: Dio
- **Local Storage**: SharedPreferences
- **Routing**: Custom Route Generator
- **UI Components**: Material Design 3
- **Icons**: Custom SVG icons
- **Fonts**: Urbanist font family
- **Internationalization**: Flutter Intl

## 📱 Screenshots

The app includes the following screens:
- **Welcome/Intro Screen** - App introduction and navigation
- **Login Screen** - User authentication with form validation
- **Home Screen** - Product listing with tabbed navigation
- **Product Detail Screen** - Detailed product information
- **Cart Screen** - Shopping cart with quantity controls
- **Wishlist Screen** - Saved favorite products

## 🏗 Architecture

The app follows clean architecture principles with clear separation of concerns:

```
lib/
├── config/           # App configuration (theme, routing, spacing)
├── core/             # Core business logic
│   ├── cubits/       # Authentication state management
│   ├── mocks/        # Mock data for development
│   └── repositories/ # Data layer abstractions
├── localization/     # Internationalization files
├── models/           # Data models
├── screens/          # UI screens and components
│   ├── home_screen/  # Main app screens
│   ├── intro_screen/ # Welcome screens
│   └── login_screen/ # Authentication screens
└── utils/            # Utilities and services
    ├── constants/    # App constants
    ├── exceptions/   # Custom exceptions
    ├── helpers/      # Helper functions
    └── services/     # Network and storage services
```

## 🔧 Setup & Installation

### Prerequisites
- Flutter SDK 3.9.2 or higher
- Dart SDK
- Android Studio / VS Code
- Git

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd fake_store_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🔑 API Integration

The app integrates with the Fake Store API:

- **Base URL**: `https://fakestoreapi.com/`
- **Authentication**: `POST /auth/login`
- **Products**: `GET /products`
- **Product Details**: `GET /products/{id}`

### Login Credentials -- IF THE FIRST ONE DOESN'T WORK TRY THE 2ND OR 3RD ONE - I used the 2nd one for testing
- **Username**: johnd
- **Password**: m38rmF$
<!-- OR -->
- **Username**: mor_2314
- **Password**: 83r5^_
<!-- OR -->
- **Username**: kevinryan
- **Password**: kev02937@

## 📊 State Management

The app uses BLoC pattern for state management:

- **AuthCubit** - User authentication state
- **GetProductsCubit** - Product data management
- **CartCubit** - Shopping cart state
- **WishlistCubit** - Wishlist management
- **LoginCubit** - Login form state

## 🎨 UI/UX Features

- **Material Design 3** - Modern design system
- **Custom Theme** - Consistent color scheme and typography
- **Responsive Layout** - Adapts to different screen sizes
- **Smooth Animations** - Enhanced user experience
- **Loading States** - Shimmer effects and loading indicators
- **Error Handling** - User-friendly error messages

## 🔒 Security Features

- **JWT Token Management** - Secure authentication
- **Token Persistence** - Automatic login on app restart
- **Input Validation** - Form validation and sanitization
- **Error Handling** - Secure error messages

## 🌐 Internationalization

The app supports multiple languages:
- English (en)
- Spanish (es)

Localization files are located in `lib/localization/` and can be extended for additional languages.

## 📦 Dependencies

### Core Dependencies
- `flutter_bloc` - State management
- `dio` - HTTP client
- `shared_preferences` - Local storage
- `flutter_svg` - SVG icon support
- `shimmer` - Loading animations
- `equatable` - Value equality

### Development Dependencies
- `flutter_lints` - Code quality
- `flutter_test` - Testing framework

## 🚀 Performance Optimizations

- **Lazy Loading** - Products loaded on demand
- **Image Caching** - Efficient image loading
- **State Optimization** - Minimal rebuilds with BLoC
- **Memory Management** - Proper disposal of resources

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📝 Development Guidelines

### Code Style
- Follow Flutter/Dart conventions
- Use meaningful variable and function names
- Add comments for complex logic
- Maintain consistent indentation

### Git Workflow
- Use descriptive commit messages
- Create feature branches for new functionality
- Test thoroughly before merging

## 🔄 Future Enhancements

Potential improvements for future versions:
- **Search Functionality** - Product search and filtering
- **User Profiles** - User account management
- **Order History** - Purchase tracking
- **Push Notifications** - Real-time updates
- **Offline Support** - Cached data for offline use
- **Payment Integration** - Checkout functionality

## 📞 Support

For questions or issues:
1. Check the existing issues in the repository
2. Create a new issue with detailed description
3. Include device information and error logs

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Built with ❤️ using Flutter**