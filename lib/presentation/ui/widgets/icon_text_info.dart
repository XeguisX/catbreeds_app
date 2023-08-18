import 'package:flutter/material.dart';

class IconTextInfo extends StatelessWidget {
  const IconTextInfo({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 72),
        const SizedBox(height: 16),
        Text(
          label,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
