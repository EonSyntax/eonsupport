import 'package:flutter/material.dart';
import 'package:eonsupport/core/constants/app_constants.dart';

/// Controller Dashboard screen for EonSupport.
/// Allows users to control remote devices and provide support.
/// UI-only placeholder - native integration will be added later via platform channels.
class ControllerDashboardScreen extends StatelessWidget {
  const ControllerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller Mode'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildStatusCard(context),
              const SizedBox(height: AppConstants.paddingLarge),
              _buildDevicesSection(context),
              const SizedBox(height: AppConstants.paddingLarge),
              _buildVideoStreamPlaceholder(context),
              const SizedBox(height: AppConstants.paddingLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppConstants.paddingSmall),
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Ready to connect',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDevicesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Devices',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppConstants.paddingMedium),
        // Mock device list
        _buildDeviceListItem(
          context,
          deviceName: 'Desktop - Office',
          status: 'Online',
          isOnline: true,
        ),
        const SizedBox(height: AppConstants.paddingSmall),
        _buildDeviceListItem(
          context,
          deviceName: 'Laptop - Remote',
          status: 'Offline',
          isOnline: false,
        ),
        const SizedBox(height: AppConstants.paddingSmall),
        _buildDeviceListItem(
          context,
          deviceName: 'Phone - Mobile',
          status: 'Online',
          isOnline: true,
        ),
      ],
    );
  }

  Widget _buildDeviceListItem(
    BuildContext context, {
    required String deviceName,
    required String status,
    required bool isOnline,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Row(
          children: [
            Icon(Icons.devices, color: isOnline ? Colors.green : Colors.grey),
            const SizedBox(width: AppConstants.paddingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deviceName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(status, style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: FilledButton(
                onPressed: isOnline ? () {} : null,
                child: const Text('Connect'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoStreamPlaceholder(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Video Stream', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppConstants.paddingMedium),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF2A2A2A) : Colors.grey[300],
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            border: Border.all(
              color: isDarkMode ? Colors.grey[700]! : Colors.grey[400]!,
              width: 1,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.video_call,
                  size: 48,
                  color: isDarkMode ? Colors.grey[600] : Colors.grey[500],
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                Text(
                  'Video stream will appear here',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: isDarkMode ? Colors.grey[600] : Colors.grey[700],
                  ),
                ),
                const SizedBox(height: AppConstants.paddingSmall),
                Text(
                  'Native integration via platform channels',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isDarkMode ? Colors.grey[700] : Colors.grey[600],
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
