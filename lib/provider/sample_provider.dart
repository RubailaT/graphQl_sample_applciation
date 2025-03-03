import 'package:flutter/material.dart';
import 'package:graphql_sampl_application/model/sample_model.dart';
import 'package:graphql_sampl_application/utils/country_service.dart';

class SampleGraphQlProvider extends ChangeNotifier {
  bool isDataLoading = false;
  SampleGraphQlModel? sampleGraphQlModel;
  List<Country> countryList = [];

  Future<void> fetchCoutriesData(BuildContext context) async {
    try {
      setDataLoading(true);
      sampleGraphQlModel = null;
      countryList.clear();

      final jsonData = await CountriesService.getCountries(context);
      sampleGraphQlModel = sampleGraphQlModelFromJson(jsonData);
      countryList = sampleGraphQlModel!.data.countries;
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      setDataLoading(false);
      notifyListeners();
    }
  }

  void setDataLoading(bool loading) {
    isDataLoading = loading;
    notifyListeners();
  }
}
