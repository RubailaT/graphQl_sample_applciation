import 'package:flutter/material.dart';
import 'package:graphql_sampl_application/model/sample_model.dart';
import 'package:graphql_sampl_application/widgets/card_info.dart';

class CountryDetailsSheet extends StatelessWidget {
  final Country countryInfo;

  const CountryDetailsSheet({super.key, required this.countryInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                countryInfo.emoji, // Removed null check since it's required
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                // Added Expanded to prevent overflow
                child: Text(
                  countryInfo.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          InfoRow(label: 'Capital', value: countryInfo.capital ?? ""),
          InfoRow(label: 'Currency', value: countryInfo.currency ?? ""),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
