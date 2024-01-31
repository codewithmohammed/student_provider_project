import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_provider_project/core/models/student_model.dart';
import 'package:student_provider_project/features/main/presentation/main_screen.dart';
import 'package:student_provider_project/presentation/themes/app_theme.dart';
import 'package:student_provider_project/provider/student_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider()..getAllStudent())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darktheme,
        home: const MainScreen(),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => NavigationProvider(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         home: HomeScreen(),
//       ),
//     );
//   }
// }

// class NavigationProvider with ChangeNotifier {
//   // Variable to track the current screen
//   String _currentScreen = 'home';

//   // Getter for the current screen
//   String get currentScreen => _currentScreen;

//   // Method to navigate to the details screen
//   void navigateToDetails() {
//     _currentScreen = 'details';
//     notifyListeners();
//   }

//   // Method to navigate back to the home screen
//   void navigateToHome() {
//     _currentScreen = 'home';
//     notifyListeners();
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final navigationProvider = Provider.of<NavigationProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Trigger navigation to details screen
//             navigationProvider.navigateToDetails();
//           },
//           child: Text('Go to Details'),
//         ),
//       ),
//     );
//   }
// }

// class DetailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final navigationProvider = Provider.of<NavigationProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Trigger navigation back to home screen
//             navigationProvider.navigateToHome();
//           },
//           child: Text('Go back to Home'),
//         ),
//       ),
//     );
//   }
// }