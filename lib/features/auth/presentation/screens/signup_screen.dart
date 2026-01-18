import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eonsupport/core/constants/app_constants.dart';
import 'package:eonsupport/core/extensions/context_extensions.dart';
import 'package:eonsupport/features/auth/viewmodel/signup_viewmodel.dart';
import 'package:eonsupport/features/auth/presentation/widgets/signup_form.dart';

/// Signup screen for EonSupport.
/// Allows new users to create an account with email, password, and display name.
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                SizedBox(height: context.screenHeight * 0.04),
                // Back button and header
                _buildHeader(context),
                SizedBox(height: context.screenHeight * 0.06),
                // Signup form
                _buildSignupFormSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back button
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back, color: context.primaryColor),
              const SizedBox(width: 8),
              Text(
                'Back',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: context.primaryColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppConstants.paddingLarge),
        // Title and subtitle
        Text(
          'Create Account',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppConstants.paddingSmall),
        Text(
          'Join EonSupport to provide or receive secure remote support',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),
        ),
      ],
    );
  }

  Widget _buildSignupFormSection(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, signupViewModel, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Form
              SignupForm(
                onSignupSuccess: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Account created successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              // Error message (if any)
              if (signupViewModel.errorMessage != null)
                _buildErrorMessage(context, signupViewModel),
              const SizedBox(height: AppConstants.paddingLarge),
              // Divider
              _buildDivider(context),
              const SizedBox(height: AppConstants.paddingLarge),
              // Login link
              _buildLoginLink(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildErrorMessage(BuildContext context, SignupViewModel viewModel) {
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

  Widget _buildLoginLink(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Already have an account?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          OutlinedButton(
            onPressed: () => Navigator.of(
              context,
            ).pushReplacementNamed(AppConstants.routeLogin),
            child: const Text('Log In'),
          ),
        ],
      ),
    );
  }
}
