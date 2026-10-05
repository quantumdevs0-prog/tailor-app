# Shalwar Kameez Tailor – Offline Management App

100% offline-first Flutter app for Pakistani shalwar kameez tailor shops.

## Features

- Add / Edit customers with auto serial numbers
- Detailed Kameez + Shalwar measurements (inches)
- Style preferences & notes
- Full measurement history (never overwrite)
- Fast search by Serial / Name / Phone
- Completely offline (SQLite via Drift)
- Material 3 + Riverpod

## How to open in Android Studio

1. Unzip the project
2. Open Android Studio → **Open** → select the `shalwar_kameez_tailor` folder
3. Wait for Flutter & Gradle sync
4. Run these commands in the terminal (bottom of Android Studio):

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

5. Press the green **Run** button (or `flutter run`)

## Requirements

- Flutter 3.16+ (stable)
- Android Studio or VS Code with Flutter extension
- Android emulator or real device (min SDK 21)

## Notes

- Serial numbers start from `000001` and auto-increment
- Measurements support decimals (e.g. 15.5)
- Editing a customer creates a **new** measurement entry and marks the previous one as history
- No internet permission is required
