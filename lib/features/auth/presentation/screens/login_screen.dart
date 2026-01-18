import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eonsupport/core/constants/app_constants.dart';
import 'package:eonsupport/core/extensions/context_extensions.dart';
import 'package:eonsupport/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:eonsupport/features/auth/presentation/widgets/login_form.dart';

/// Login screen for EonSupport.
/// Provides email/password authentication UI with Material 3 design.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingLarge,
              vertical: AppConstants.paddingLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: context.screenHeight * 0.08),
                // Branding section
                _buildBrandingSection(context),
                SizedBox(height: context.screenHeight * 0.12),
                // Login form
                _buildLoginFormSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandingSection(BuildContext context) {
    return Column(
      children: [
        // App logo placeholder
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: context.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.security_rounded,
            size: 48,
            color: context.onPrimaryColor,
          ),
        ),
        const SizedBox(height: AppConstants.paddingLarge),
        // App name
        Text(
          AppConstants.appName,
          style: context.isDarkMode
              ? Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                )
              : Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: AppConstants.paddingSmall),
        // Tagline
        Text(
          'Secure remote support',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLoginFormSection(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: Consumer<AuthViewModel>(
        builder: (context, authViewModel, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Form
              const LoginForm(),
              const SizedBox(height: AppConstants.paddingLarge),
              // Error message (if any)
              if (authViewModel.errorMessage != null)
                _buildErrorMessage(context, authViewModel),
              const SizedBox(height: AppConstants.paddingLarge),
              // Divider
              _buildDivider(context),
              const SizedBox(height: AppConstants.paddingLarge),
              // Signup link
              _buildSignupLink(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildErrorMessage(BuildContext context, AuthViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: context.errorColor.withValues(alpha: 0.1),
        border: Border.all(color: context.errorColor, width: 1),
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: context.errorColor, size: 20),
          const SizedBox(width: AppConstants.paddingMedium),
          Expanded(
            child: Text(
              viewModel.errorMessage ?? '',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: context.errorColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Theme.of(context).dividerColor, thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium,
          ),
          child: Text('or', style: Theme.of(context).textTheme.labelMedium),
        ),
        Expanded(
          child: Divider(color: Theme.of(context).dividerColor, thickness: 1),
        ),
      ],
    );
  }

  Widget _buildSignupLink(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Don\'t have an account?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          FilledButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppConstants.routeSignup),
            child: const Text('Create Account'),
          ),
        ],
      ),
    );
  }
}
