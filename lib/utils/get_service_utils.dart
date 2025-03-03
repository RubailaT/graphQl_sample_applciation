// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:graphql_sampl_application/constants/string_class.dart';
// import 'package:graphql_sampl_application/utils/app_utils.dart';
// import 'package:graphql_sampl_application/utils/shared_utils.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class GetServiceUtils {
//   static Future<String> fetchData(String getUrl, BuildContext context) async {
//     try {
//       final hasNetwork = await AppUtils.hasInternet();
//       if (!hasNetwork) {
//         if (context.mounted) {
//           AppUtils.showInSnackBarNormal('No internet connection', context);
//         }
//         throw Exception('No internet connection');
//       } else {
//         debugPrint('Has Internet');
//         final url = Uri.parse(getUrl);
//         String token = await SharedUtils.getString(StringClass.token);
//         debugPrint(token.toString());
//         final headers = {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token",
//         };
//         final response = await http.get(url, headers: headers);
//         if (response.statusCode == 200) {
//           if (kDebugMode) {}
//           return response.body;
//         } else if (response.statusCode == 500) {
//           if (context.mounted) {
//             AppUtils.showInSnackBarNormal(
//               'status code: ${response.statusCode}, - Bad Gateway',
//               context,
//             );
//           }
//           debugPrint('$url status code: ${response.statusCode}');
//           throw Exception('Failed to get Data');
//         } else if (response.statusCode == 401) {
//           SharedPreferences preferences = await SharedPreferences.getInstance();
//           await preferences.clear();
//           debugPrint('$url status code: ${response.statusCode}');
//           throw Exception('Failed to get Data');
//         } else {
//           if (context.mounted) {
//             AppUtils.showInSnackBarNormal(
//               'status code: ${response.statusCode}, Failed to get Data',
//               context,
//             );
//           }
//           debugPrint('$url status code: ${response.statusCode}');
//           throw Exception('Failed to get Data');
//         }
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
