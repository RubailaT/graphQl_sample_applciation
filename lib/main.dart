import 'package:flutter/material.dart';
import 'package:graphql_sampl_application/provider/sample_provider.dart';
import 'package:graphql_sampl_application/screens/screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SampleGraphQlProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: const CountriesScreen(),
      ),
    );
  }
}
