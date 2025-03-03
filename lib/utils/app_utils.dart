import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_sampl_application/constants/color_class.dart';
import 'package:graphql_sampl_application/constants/text_style_class.dart';
import 'package:http/http.dart' as http;

class AppUtils {
  // To check internet connection
  static Future<bool> hasInternet() async {
    try {
      final url = Uri.parse('https://www.google.com');
      final response = await http.get(url);
      return response.statusCode == 200;
    } catch (e) {
      return false; // Request failed, so no internet connection
    }
  }

  /// Show a normal snackbar with a message
  static showInSnackBarNormal(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        closeIconColor: ColorClass.white,
        backgroundColor: ColorClass.limeGreen,
        showCloseIcon: true,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
        content: Text(message, style: TextStyleClass.regWhiteTextStyle()),
      ),
    );
  }

  // BoxDecoration
  static BoxDecoration boxDecoration(double size) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(size),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 0,
          blurRadius: 4,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
    );
  }

  static loadingWidget(BuildContext context, double? size) {
    return SizedBox(
      height: size,
      child: const Center(
        child: CupertinoActivityIndicator(color: Colors.black),
      ),
    );
  }

  static noDataFoundWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Oops!!",
            style: TextStyleClass.blackTextStyle(ColorClass.black),
          ),
          const SizedBox(height: 10.0),
          Text("No data found", style: TextStyleClass.grayTextStyle()),
        ],
      ),
    );
  }
}
