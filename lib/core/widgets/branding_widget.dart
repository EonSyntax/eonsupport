import 'package:flutter/material.dart';
import 'package:eonsupport/core/constants/app_constants.dart';
import 'package:eonsupport/core/extensions/context_extensions.dart';

/// Small branding widget used on the login screen and other entry points.
class BrandingWidget extends StatelessWidget {
  const BrandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Text(
          AppConstants.appName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
