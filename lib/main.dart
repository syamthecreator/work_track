import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_track/app/app_routes.dart';
import 'package:work_track/core/utils/provider_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviderBinding.providers,

      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.appointments,
      ),
    );
  }
}
