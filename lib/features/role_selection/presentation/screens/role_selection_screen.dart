import 'package:flutter/material.dart';
import 'package:eonsupport/core/constants/app_constants.dart';
import 'package:eonsupport/core/extensions/context_extensions.dart';
import 'package:eonsupport/features/controller/presentation/screens/controller_dashboard_screen.dart';
import 'package:eonsupport/features/host/presentation/screens/host_dashboard_screen.dart';

/// Role Selection screen for EonSupport.
/// Allows users to choose between Controller Mode (provide support) or Host Mode (receive support).
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('What would you like to do?')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: context.screenHeight * 0.06),
              // Subtitle
              Text(
                'Select your role to get started',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.screenHeight * 0.08),
              // Role cards
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Controller mode card
                    _buildRoleCard(
                      context: context,
                      icon: Icons.keyboard_control,
                      title: 'Provide Support',
                      subtitle: 'Control a device remotely',
                      description:
                          'Connect to another device and provide technical support',
                      onTap: () => _navigateToController(context),
                    ),
                    const SizedBox(height: AppConstants.paddingLarge),
                    // Host mode card
                    _buildRoleCard(
                      context: context,
                      icon: Icons.phone_in_talk,
                      title: 'Receive Support',
                      subtitle: 'Allow remote access to your device',
                      description:
                          'Share your screen and let a support agent help you',
                      onTap: () => _navigateToHost(context),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.screenHeight * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon and title
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: context.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: context.primaryColor, size: 28),
                  ),
                  const SizedBox(width: AppConstants.paddingMedium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: context.primaryColor),
                ],
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              // Description
              Text(
                description,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(height: 1.4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToController(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ControllerDashboardScreen()),
    );
  }

  void _navigateToHost(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HostDashboardScreen()),
    );
  }
}
