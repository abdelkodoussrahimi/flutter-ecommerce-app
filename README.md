# E-Commerce Flutter App

A comprehensive Flutter e-commerce mobile application with features including authentication, product browsing, cart management, orders, and more.

## Features

- 🔐 User Authentication (Sign Up, Login, Password Reset)
- 🏠 Home Screen with Categories and Promotions
- 🛍️ Product Browsing and Search
- ❤️ Favorite Items Management
- 🛒 Shopping Cart
- 📍 Address Management
- 📦 Order Management (Pending & Archive)
- 🔔 Push Notifications (Firebase)
- 🗺️ Google Maps Integration
- 💳 Payment Integration
- 🎨 Modern UI with Animations

## Tech Stack

- **Framework**: Flutter
- **State Management**: GetX
- **Backend**: PHP REST API
- **Database**: MySQL (via PHP backend)
- **Local Storage**: SharedPreferences, SQLite
- **Maps**: Google Maps
- **Notifications**: Firebase Cloud Messaging
- **Authentication**: Email/Password, Google Sign-In

## Getting Started

### Prerequisites

- Flutter SDK (>=2.19.4 <3.0.0)
- Dart SDK
- Android Studio / VS Code
- Firebase account (for notifications)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd projct2
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure the API endpoints in `lib/linkapi.dart`:
```dart
static const String server = "YOUR_API_URL";
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── bindings/          # Dependency injection bindings
├── controller/        # Business logic controllers
├── core/             # Core utilities and constants
│   ├── class/        # Helper classes
│   ├── constant/     # Constants (colors, routes, images)
│   ├── functions/    # Utility functions
│   ├── middleware/   # Route middleware
│   └── services/     # Initial services
├── data/             # Data layer
│   ├── datasource/   # Data sources
│   ├── model/        # Data models
│   └── remote/       # API calls
├── routes.dart       # Route definitions
├── main.dart         # App entry point
└── view/             # UI screens and widgets
    ├── screen/       # Main screens
    └── widget/       # Reusable widgets
```

## API Endpoints

The app communicates with a PHP backend. Configure the base URL in `lib/linkapi.dart`.

## Dependencies

See `pubspec.yaml` for the complete list of dependencies.

## License

This project is private and not intended for public distribution.

## Contact

For questions or support, please contact the development team.
