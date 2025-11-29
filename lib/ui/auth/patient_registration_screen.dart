import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';
import 'package:oncall_lab/core/services/storage_service.dart';
import 'package:oncall_lab/core/services/supabase_service.dart';
import 'package:oncall_lab/stores/auth_store.dart';
import 'package:oncall_lab/ui/auth/widgets/step_progress_bar.dart';

class PatientRegistrationScreen extends StatefulWidget {
  const PatientRegistrationScreen({super.key});

  @override
  State<PatientRegistrationScreen> createState() =>
      _PatientRegistrationScreenState();
}

class _PatientRegistrationScreenState extends State<PatientRegistrationScreen> {
  final int _totalSteps = 3;
  int _currentStep = 0;
  late final List<GlobalKey<FormState>> _stepFormKeys =
      List.generate(_totalSteps, (_) => GlobalKey<FormState>());
  final List<IconData> _stepIcons = const [
    Icons.person_outline,
    Icons.security_outlined,
    Icons.home_outlined,
  ];
  final List<String> _stepLabels = const [
    'Basics',
    'Security',
    'Address',
  ];

  // Controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _registrationNumberController = TextEditingController();
  final _passportNumberController = TextEditingController();
  final _allergiesController = TextEditingController();

  File? _selectedProfilePhoto;

  String? _selectedGender;
  bool _isMongolianCitizen = true;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    _registrationNumberController.dispose();
    _passportNumberController.dispose();
    _allergiesController.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    final currentForm = _stepFormKeys[_currentStep].currentState;
    if (currentForm == null) return;
    if (currentForm.validate()) {
      FocusScope.of(context).unfocus();
      if (_currentStep < _totalSteps - 1) {
        setState(() => _currentStep++);
      } else {
        _handleRegister();
      }
    }
  }

  void _goToPreviousStep() {
    if (_currentStep == 0) return;
    FocusScope.of(context).unfocus();
    setState(() => _currentStep--);
  }

  Future<void> _handleRegister() async {
    final success = await authStore.registerPatient(
      phoneNumber: _phoneController.text.trim(),
      password: _passwordController.text,
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim().isEmpty
          ? null
          : _emailController.text.trim(),
      age: _ageController.text.isEmpty
          ? null
          : int.tryParse(_ageController.text),
      gender: _selectedGender,
      permanentAddress: _addressController.text.trim(),
      registrationNumber: _registrationNumberController.text.trim().isEmpty
          ? null
          : _registrationNumberController.text.trim(),
      isMongolianCitizen: _isMongolianCitizen,
      isForeignCitizen: !_isMongolianCitizen,
      passportNumber: _passportNumberController.text.trim().isEmpty
          ? null
          : _passportNumberController.text.trim(),
      allergies: _allergiesController.text.trim().isEmpty
          ? null
          : _allergiesController.text.trim(),
    );

    if (!mounted) return;
    if (success) {
      // Optional profile photo upload after account creation
      if (_selectedProfilePhoto != null) {
        try {
          final userId = authStore.currentUser?.id;
          if (userId != null) {
            final url = await StorageService.uploadProfilePhoto(
              userId: userId,
              file: _selectedProfilePhoto!,
            );
            if (url != null) {
              await supabase
                  .from('profiles')
                  .update({
                    'avatar_url': url,
                    'updated_at': DateTime.now().toIso8601String(),
                  })
                  .eq('id', userId);
              await authStore.loadCurrentProfile();
            }
          }
        } catch (_) {
          // Ignore upload errors here; account is already created
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Patient account created successfully!'),
        ),
      );
      Navigator.of(context).pop();
    } else if (authStore.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authStore.errorMessage!),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Patient Registration'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Patient Account',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Step-by-step onboarding for a smoother experience.',
                style: TextStyle(color: AppColors.grey),
              ),
              const SizedBox(height: 24),
              StepProgressBar(
                totalSteps: _totalSteps,
                currentStep: _currentStep,
                icons: _stepIcons,
                labels: _stepLabels,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Form(
                    key: _stepFormKeys[_currentStep],
                    child: SingleChildScrollView(
                      key: ValueKey(_currentStep),
                      physics: const BouncingScrollPhysics(),
                      child: _buildStepContent(_currentStep),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed:
                            authStore.isLoading ? null : _goToPreviousStep,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Back'),
                      ),
                    ),
                  if (_currentStep > 0) const SizedBox(width: 12),
                  Expanded(
                    child: Observer(
                      builder: (_) => ElevatedButton(
                        onPressed: authStore.isLoading ? null : _goToNextStep,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: authStore.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Text(
                                _currentStep == _totalSteps - 1
                                    ? 'Create Account'
                                    : 'Continue',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Already have an account? Sign in'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return _buildPersonalInfoStep();
      case 1:
        return _buildSecurityStep();
      case 2:
      default:
        return _buildAddressStep();
    }
  }

  Widget _buildPersonalInfoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _firstNameController,
                decoration: _buildInputDecoration(
                  'First name *',
                  Icons.person_outline,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _lastNameController,
                decoration: _buildInputDecoration(
                  'Last name *',
                  Icons.person_outline,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          decoration: _buildInputDecoration(
            'Phone number *',
            Icons.phone_outlined,
            hint: '99123456',
          ),
          validator: (value) {
            final v = value?.trim() ?? '';
            if (v.isEmpty) return 'Required';
            if (v.length != 8 || int.tryParse(v) == null) {
              return 'Enter 8 digit number (e.g. 99123456)';
            }
            return null;
          },
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: _buildInputDecoration(
            'Email (optional)',
            Icons.email_outlined,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Profile photo (optional)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              backgroundImage: _selectedProfilePhoto != null
                  ? FileImage(_selectedProfilePhoto!)
                  : null,
              child: _selectedProfilePhoto == null
                  ? const Icon(
                      Icons.camera_alt,
                      color: AppColors.primary,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {
                  final file = await StorageService.pickImage();
                  if (file != null) {
                    setState(() {
                      _selectedProfilePhoto = file;
                    });
                  }
                },
                icon: const Icon(Icons.upload),
                label: Text(
                  _selectedProfilePhoto == null
                      ? 'Upload profile photo'
                      : 'Change photo',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSecurityStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        TextFormField(
          controller: _ageController,
          keyboardType: TextInputType.number,
          decoration: _buildInputDecoration(
            'Age',
            Icons.cake_outlined,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Gender',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          children: ['male', 'female', 'other'].map((gender) {
            final isSelected = _selectedGender == gender;
            return ChoiceChip(
              label: Text(gender[0].toUpperCase() + gender.substring(1)),
              selected: isSelected,
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              onSelected: (_) {
                setState(() => _selectedGender = gender);
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: _buildInputDecoration(
            'Password *',
            Icons.lock_outline,
          ).copyWith(
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppColors.primary,
              ),
              onPressed: () {
                setState(() => _obscurePassword = !_obscurePassword);
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required';
            }
            if (value.length < 6) {
              return 'Must be at least 6 characters';
            }
            return null;
          },
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          decoration: _buildInputDecoration(
            'Confirm password *',
            Icons.lock_outline,
          ).copyWith(
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppColors.primary,
              ),
              onPressed: () {
                setState(() =>
                    _obscureConfirmPassword = !_obscureConfirmPassword);
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required';
            }
            if (value != _passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildAddressStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        TextFormField(
          controller: _addressController,
          maxLines: 2,
          decoration: _buildInputDecoration(
            'Permanent address *',
            Icons.location_on_outlined,
            hint: 'Street, district, city',
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Required';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _registrationNumberController,
                decoration: _buildInputDecoration(
                  'Registration number',
                  Icons.badge_outlined,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _passportNumberController,
                decoration: _buildInputDecoration(
                  'Passport number',
                  Icons.airplane_ticket_outlined,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          title: const Text('Mongolian citizen'),
          activeColor: AppColors.primary,
          value: _isMongolianCitizen,
          onChanged: (value) {
            setState(() => _isMongolianCitizen = value);
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _allergiesController,
          maxLines: 2,
          decoration: _buildInputDecoration(
            'Allergies (optional)',
            Icons.health_and_safety_outlined,
          ),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon,
      {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon, color: AppColors.primary),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: AppColors.grey.withValues(alpha: 0.05),
    );
  }
}
