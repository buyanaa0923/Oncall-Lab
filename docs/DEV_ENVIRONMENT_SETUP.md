# Development Environment Setup (Windows)

## Prerequisites Installation

### 1. Install Flutter SDK

**Step 1: Download Flutter**
```bash
# Download Flutter SDK from official website
# https://docs.flutter.dev/get-started/install/windows
```

**Step 2: Extract to C:\src\flutter**
```cmd
# Create directory
mkdir C:\src
# Extract flutter_windows_xxx.zip to C:\src\flutter
```

**Step 3: Add to PATH**
- Open "Edit environment variables for your account"
- Under User Variables, find "Path"
- Click "Edit" → "New"
- Add: `C:\src\flutter\bin`
- Click OK

**Step 4: Verify Installation**
```bash
flutter --version
flutter doctor
```

### 2. Install Android Studio

**Required for Android development**

1. Download Android Studio from: https://developer.android.com/studio
2. Run installer
3. During setup, ensure these are checked:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device (AVD)

**Configure Android SDK**
```bash
# Run Flutter doctor to check
flutter doctor --android-licenses
# Accept all licenses by typing 'y'
```

### 3. Install Visual Studio Code (Recommended)

1. Download from: https://code.visualstudio.com/
2. Install Flutter extension:
   - Open VS Code
   - Go to Extensions (Ctrl+Shift+X)
   - Search "Flutter"
   - Install "Flutter" by Dart Code
   - This also installs Dart extension

### 4. Install Git (for version control)

```bash
# Download from: https://git-scm.com/download/win
# Run installer with default settings
```

### 5. Set up Android Emulator

**Option A: Using Android Studio**
1. Open Android Studio
2. Tools → Device Manager
3. Create Virtual Device
4. Choose device (e.g., Pixel 5)
5. Download system image (recommend API 33 or higher)
6. Finish setup

**Option B: Using Physical Device**
1. Enable Developer Options on your Android phone:
   - Settings → About Phone
   - Tap "Build Number" 7 times
2. Enable USB Debugging:
   - Settings → Developer Options
   - Turn on "USB Debugging"
3. Connect phone via USB
4. Run: `flutter devices`

### 6. Verify Complete Setup

```bash
flutter doctor -v
```

**Expected output should show:**
- ✓ Flutter (version)
- ✓ Android toolchain
- ✓ Chrome (for web development)
- ✓ Visual Studio Code (if installed)
- ✓ Connected device or emulator

## Project Setup

### 1. Navigate to Project

```bash
cd D:\Dev\projects\oncall_lab
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run Build Runner (for code generation)

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Create Environment Configuration

Create `.env` file in project root:
```env
# Supabase Configuration
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key

# Optional: For local development
ENVIRONMENT=development
```

**Note:** We'll get these values after setting up Supabase backend.

### 5. Run the Application

```bash
# Check available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Or run and select device interactively
flutter run
```

## Development Workflow

### Hot Reload
While app is running:
- Press `r` for hot reload
- Press `R` for hot restart
- Press `q` to quit

### Code Generation (MobX, Freezed, AutoRoute)

**Watch mode** (runs automatically on file changes):
```bash
dart run build_runner watch --delete-conflicting-outputs
```

**One-time build**:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Linting and Analysis

```bash
# Analyze code
flutter analyze

# Format code
dart format lib/ test/
```

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

## Troubleshooting

### Issue: Flutter doctor shows Android Studio not found
**Solution:**
```bash
flutter config --android-studio-dir="C:\Program Files\Android\Android Studio"
```

### Issue: Gradle build fails
**Solution:**
1. Update Android SDK via Android Studio
2. Set JAVA_HOME if needed
3. Check `android/gradle.properties` settings

### Issue: Build runner fails
**Solution:**
```bash
# Clean and rebuild
flutter clean
flutter pub get
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Issue: Emulator won't start
**Solution:**
1. Check virtualization is enabled in BIOS
2. Ensure Hyper-V is disabled if using other virtualization
3. Try creating a new AVD with lower API level

## Recommended VS Code Extensions

- Flutter (Dart-Code.flutter)
- Dart (Dart-Code.dart-code)
- Error Lens (usernamehw.errorlens)
- GitLens (eamodio.gitlens)
- Material Icon Theme (PKief.material-icon-theme)

## Next Steps

1. Set up Supabase backend (see `SUPABASE_SETUP.md`)
2. Configure database schema (see `DATABASE_DESIGN.md`)
3. Implement authentication flow
4. Build core features

## Resources

- Flutter Documentation: https://docs.flutter.dev/
- Flutter Cookbook: https://docs.flutter.dev/cookbook
- MobX Documentation: https://mobx.netlify.app/
- Supabase Documentation: https://supabase.com/docs
