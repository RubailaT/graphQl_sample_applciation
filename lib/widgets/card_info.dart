import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text('$label: ', style: Theme.of(context).textTheme.titleMedium),
          Expanded(
            // Added Expanded to prevent overflow
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
