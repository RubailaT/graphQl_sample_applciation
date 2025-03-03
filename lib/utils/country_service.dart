import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_sampl_application/utils/app_utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountriesService {
  static const String _baseUrl = 'https://countries.trevorblades.com/graphql';

  static String get countriesQuery => '''
    query {
      countries {
        code
        name
        emoji
        capital
        currency
        languages {
          name
        }
      }
    }
  ''';

  static Future<String> getCountries(BuildContext context) async {
    try {
      final hasNetwork = await AppUtils.hasInternet();
      if (!hasNetwork) {
        if (context.mounted) {
          AppUtils.showInSnackBarNormal('No internet connection', context);
        }
        throw Exception('No internet connection');
      } else {
        debugPrint('Has Internet');
        final url = Uri.parse(_baseUrl);

        final headers = {"Content-Type": "application/json"};

        final body = jsonEncode({'query': countriesQuery});

        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          if (kDebugMode) {
            print('Response: ${response.body}');
          }
          return response.body;
        } else if (response.statusCode == 500) {
          if (context.mounted) {
            AppUtils.showInSnackBarNormal(
              'status code: ${response.statusCode}, - Bad Gateway',
              context,
            );
          }
          debugPrint('$url status code: ${response.statusCode}');
          throw Exception('Failed to get Data');
        } else {
          if (context.mounted) {
            AppUtils.showInSnackBarNormal(
              'status code: ${response.statusCode}, Failed to get Data',
              context,
            );
          }
          debugPrint('$url status code: ${response.statusCode}');
          throw Exception('Failed to get Data');
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
