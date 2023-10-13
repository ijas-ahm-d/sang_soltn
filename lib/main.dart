import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sang/utils/providers/providers_list.dart';
import 'package:sang/utils/routes/routes.dart';
import 'package:sang/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProvidersList.provider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sang solution',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(
          // seedColor: AppColors.kWhite,
          // ),
          useMaterial3: true,
        ),
        initialRoute: RoutesNames.homeRoute,
        onGenerateRoute: Routes.genericRoute,
      ),
    );
  }
}
