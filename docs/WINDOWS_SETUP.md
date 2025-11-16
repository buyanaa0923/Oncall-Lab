# Windows Development Environment Setup Guide

This guide will help you set up your Windows development environment for the OnCall Lab Flutter application.

## Prerequisites

### 1. Install Flutter SDK

1. Download Flutter SDK from https://docs.flutter.dev/get-started/install/windows
2. Extract the zip file to a desired location (e.g., `C:\src\flutter`)
3. Add Flutter to your PATH:
   - Search for "Environment Variables" in Windows
   - Edit the "Path" user variable
   - Add the full path to `flutter\bin` (e.g., `C:\src\flutter\bin`)

4. Verify installation:
```bash
flutter doctor
```

### 2. Install Android Studio

1. Download from https://developer.android.com/studio
2. During installation, ensure these components are selected:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device (AVD)

3. After installation, open Android Studio and:
   - Go to Settings → Appearance & Behavior → System Settings → Android SDK
   - Install Android SDK Command-line Tools
   - Install at least one Android SDK Platform (Android 13.0 or higher recommended)

4. Configure Flutter to use Android Studio:
```bash
flutter config --android-studio-dir="C:\Program Files\Android\Android Studio"
```

### 3. Install Visual Studio Code (Recommended)

1. Download from https://code.visualstudio.com/
2. Install these extensions:
   - Flutter (by Dart Code)
   - Dart (by Dart Code)
   - Error Lens (helpful for debugging)

### 4. Install Git

1. Download from https://git-scm.com/download/win
2. Install with default options
3. Verify: `git --version`

### 5. Set Up Android Emulator

1. Open Android Studio
2. Go to Tools → Device Manager
3. Click "Create Device"
4. Select a device (e.g., Pixel 5)
5. Download a system image (e.g., Android 13.0 - API 33)
6. Finish creating the AVD

### 6. iOS Setup (Optional - requires macOS)

For iOS development, you'll need:
- macOS with Xcode installed
- Apple Developer account

## Project Setup

### 1. Clone the Repository

```bash
cd D:\Dev\projects
git clone <your-repo-url> oncall_lab
cd oncall_lab
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Supabase

Create a new file `lib/core/constants/supabase_config.dart`:

```dart
class SupabaseConfig {
  static const String supabaseUrl = 'https://zrwtugcgimaocrhjdtob.supabase.co';
  static const String supabaseAnonKey = 'YOUR_ANON_KEY_HERE';
}
```

**IMPORTANT:** Get your anon key from Supabase dashboard:
1. Go to https://supabase.com/dashboard/project/zrwtugcgimaocrhjdtob/settings/api
2. Copy the "anon public" key
3. Replace `YOUR_ANON_KEY_HERE` in the config file

**SECURITY NOTE:** Never commit this file with real keys to version control. Add it to `.gitignore`:

```
# .gitignore
lib/core/constants/supabase_config.dart
```

### 4. Generate Code

The project uses code generation for MobX, Freezed, and AutoRoute:

```bash
# One-time generation
dart run build_runner build --delete-conflicting-outputs

# Or use watch mode during development
dart run build_runner watch --delete-conflicting-outputs
```

### 5. Run the Application

Start an emulator or connect a physical device, then:

```bash
# Check connected devices
flutter devices

# Run the app
flutter run

# Run in debug mode with hot reload
flutter run --debug

# Run in release mode (for testing performance)
flutter run --release
```

## Common Issues & Solutions

### Issue: "cmdline-tools component is missing"

**Solution:**
1. Open Android Studio
2. Go to Settings → Appearance & Behavior → System Settings → Android SDK
3. Switch to "SDK Tools" tab
4. Check "Android SDK Command-line Tools (latest)"
5. Click "Apply"

### Issue: "Unable to find bundled Java version"

**Solution:**
1. Set JAVA_HOME environment variable:
   - Android Studio includes JDK at: `C:\Program Files\Android\Android Studio\jbr`
   - Add to environment variables: `JAVA_HOME=C:\Program Files\Android\Android Studio\jbr`

### Issue: "Gradle build failed"

**Solution:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

### Issue: Build runner errors

**Solution:**
```bash
# Clean previous builds
flutter clean
dart run build_runner clean

# Rebuild
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### Issue: "Waiting for another flutter command to release the startup lock"

**Solution:**
```bash
# Delete the lock file
del %LOCALAPPDATA%\flutter\.lock
```

## Development Workflow

### Daily Development

1. Start build_runner in watch mode (in a separate terminal):
```bash
dart run build_runner watch --delete-conflicting-outputs
```

2. Start the app with hot reload:
```bash
flutter run
```

3. Make changes to your code - Flutter will hot reload automatically

### Before Committing

Always run these commands before committing:

```bash
# Format code
flutter format .

# Analyze code
flutter analyze

# Run tests
flutter test

# Ensure build is successful
flutter build apk --debug
```

## Useful Commands

```bash
# Clean build artifacts
flutter clean

# Update dependencies
flutter pub upgrade

# Run tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Build APK (debug)
flutter build apk --debug

# Build APK (release)
flutter build apk --release

# Check for outdated packages
flutter pub outdated

# Generate models/routes/stores
dart run build_runner build --delete-conflicting-outputs
```

## IDE Configuration (VS Code)

Create `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "OnCall Lab",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart"
    },
    {
      "name": "OnCall Lab (Profile Mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "profile",
      "program": "lib/main.dart"
    }
  ]
}
```

Create `.vscode/settings.json`:

```json
{
  "dart.flutterSdkPath": "C:\\src\\flutter",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  },
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [80],
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false
  }
}
```

## Next Steps

1. Review the Backend Architecture documentation in `docs/BACKEND_ARCHITECTURE.md`
2. Check the database schema in Supabase dashboard
3. Review the Flutter integration guide in `docs/FLUTTER_INTEGRATION.md`
4. Start building features!

## Resources

- Flutter Documentation: https://docs.flutter.dev/
- Supabase Flutter Guide: https://supabase.com/docs/guides/getting-started/tutorials/with-flutter
- MobX Documentation: https://pub.dev/packages/mobx
- Freezed Documentation: https://pub.dev/packages/freezed
- AutoRoute Documentation: https://pub.dev/packages/auto_route
