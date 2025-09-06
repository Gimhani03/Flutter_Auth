# Flutter Auth

This authentication module was created by me for a university group project—a medicine delivery mobile app. It demonstrates Firebase Auth integration for user sign up, sign in, and sign out. This project is suitable for learning and as a starter template for authentication-based Flutter apps.

## Features

- Email & password sign up
- Email & password sign in
- Firebase authentication integration
- Simple UI for authentication

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Firebase account](https://firebase.google.com/)

### Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/Gimhani03/Flutter_Auth.git
   cd Flutter_Auth
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Configure Firebase:

   - Add your `google-services.json` to `android/app/`.
   - Add your `GoogleService-Info.plist` to `ios/Runner/`.
   - Ensure Firebase is set up in the [Firebase Console](https://console.firebase.google.com/).

4. Run the app:
   ```sh
   flutter run
   ```

## Project Structure

- `lib/` - Main app code
- `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` - Platform-specific code
- `test/` - Unit and widget tests

## Main Files

- `main.dart` - App entry point
- `firebase_auth_service.dart` - Firebase authentication logic
- `signup_screen.dart` - Sign up UI

## Testing

Run widget tests with:

```sh
flutter test
```

## License

This project is licensed under the MIT License.
