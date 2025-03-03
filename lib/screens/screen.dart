import 'package:flutter/material.dart';
import 'package:graphql_sampl_application/model/sample_model.dart';
import 'package:graphql_sampl_application/provider/sample_provider.dart';
import 'package:graphql_sampl_application/utils/app_utils.dart';
import 'package:graphql_sampl_application/widgets/country_bottomsheet.dart';
import 'package:provider/provider.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SampleGraphQlProvider>(
        context,
        listen: false,
      ).fetchCoutriesData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<SampleGraphQlProvider>().fetchCoutriesData(context);
            },
          ),
        ],
      ),
      body: Consumer<SampleGraphQlProvider>(
        builder: (context, provider, child) {
          return provider.isDataLoading
              ? AppUtils.loadingWidget(context, 50)
              : provider.countryList.isNotEmpty
              ? ListView.builder(
                itemCount: provider.countryList.length,
                itemBuilder: (context, index) {
                  final countryData = provider.countryList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: Text(
                        countryData.emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(countryData.name), // Added title
                      subtitle: Text(
                        'Code: ${countryData.code}',
                      ), // Added subtitle
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder:
                              (context) =>
                                  CountryDetailsSheet(countryInfo: countryData),
                        );
                      },
                    ),
                  );
                },
              )
              : AppUtils.noDataFoundWidget();
        },
      ),
    );
  }
}
