import 'dart:math';

/// Helper class to manage default avatar selection based on user gender and role
class AvatarHelper {
  /// Get default avatar path based on gender, role, and user ID
  ///
  /// File structure: {gender}_{role}_{number}.png
  /// Example: male_doctor_1.png, female_nurse_2.png
  ///
  /// [gender] - 'male' or 'female' (defaults to 'male' if null)
  /// [role] - 'doctor', 'nurse', or 'user' (patient)
  /// [userId] - Used to deterministically select avatar number for consistency
  static String getDefaultAvatar({
    String? gender,
    required String role,
    String? userId,
  }) {
    // Normalize inputs
    final normalizedGender = _normalizeGender(gender);
    final normalizedRole = _normalizeRole(role);

    // Get available avatar count for this gender/role combination
    final avatarCount = _getAvatarCount(normalizedGender, normalizedRole);

    // Select avatar number deterministically based on userId
    final avatarNumber = _selectAvatarNumber(userId, avatarCount);

    return 'assets/avatars/${normalizedGender}_${normalizedRole}_$avatarNumber.png';
  }

  /// Normalize gender to 'male' or 'female'
  static String _normalizeGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return 'male'; // Default to male
    }

    final lower = gender.toLowerCase().trim();
    if (lower == 'female' || lower == 'f' || lower == 'woman') {
      return 'female';
    }
    return 'male'; // Default to male for any other value
  }

  /// Normalize role to 'doctor', 'nurse', or 'user'
  static String _normalizeRole(String role) {
    final lower = role.toLowerCase().trim();

    if (lower == 'doctor' || lower == 'physician') {
      return 'doctor';
    } else if (lower == 'nurse' || lower == 'lab_technician' || lower == 'technician') {
      return 'nurse';
    } else {
      return 'user'; // patient or any other role
    }
  }

  /// Get the number of available avatars for a gender/role combination
  /// This should be updated as more avatars are added
  static int _getAvatarCount(String gender, String role) {
    // Current avatar counts based on existing files
    // Update these numbers when adding more avatars
    const avatarCounts = {
      'male_doctor': 1,
      'male_nurse': 2,
      'male_user': 1,
      'female_doctor': 1,
      'female_nurse': 1,
      'female_user': 2,
    };

    final key = '${gender}_$role';
    return avatarCounts[key] ?? 1; // Default to 1 if not found
  }

  /// Deterministically select an avatar number based on userId
  /// This ensures the same user always gets the same avatar
  static int _selectAvatarNumber(String? userId, int maxCount) {
    if (userId == null || userId.isEmpty) {
      // If no userId, return random number (will be different each time)
      return Random().nextInt(maxCount) + 1;
    }

    // Use hash code to deterministically select a number
    final hash = userId.hashCode.abs();
    return (hash % maxCount) + 1;
  }

  /// Check if a URL is a default avatar (from our assets)
  static bool isDefaultAvatar(String? url) {
    if (url == null || url.isEmpty) return false;
    return url.startsWith('assets/avatars/') && url.endsWith('.png');
  }

  /// Update avatar counts when new avatars are added
  /// This is a helper method for future expansion
  static Map<String, int> getAvatarInventory() {
    return {
      'male_doctor': 1,
      'male_nurse': 2,
      'male_user': 1,
      'female_doctor': 1,
      'female_nurse': 1,
      'female_user': 2,
    };
  }
}
