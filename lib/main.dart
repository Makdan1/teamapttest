import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teamapttest/core/services/database_service.dart';
import 'package:teamapttest/ui/screens/home/landing_view.dart';
import 'package:teamapttest/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:teamapttest/utils/progressBarManager/dialog_manager.dart';
import 'package:teamapttest/utils/progressBarManager/dialog_service.dart';
import 'package:teamapttest/utils/router/navigation_service.dart';
import 'package:teamapttest/utils/router/router.dart';
import 'ui/screens/bottom_navigation/bottom_nav_model_view.dart';
import 'ui/screens/home/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  //Initialize the database
  await DatabaseService.initDatabase();
  setupLocator();
  return runApp(ChangeNotifierProvider<HomeViewModel>(
    create: (_) => HomeViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => AppStateProvider()),
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Team Apt',
        builder: (context, child) => Navigator(
          key: locator<ProgressService>().progressNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
            return ProgressManager(child: child!);
          }),
        ),
        // This get the selected saved theme
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        // This initialize the navigator service
        navigatorKey: locator<NavigationService>().navigationKey,
        home: const FirstScreen(),
        onGenerateRoute: generateRoute,
    ));
  }
}
