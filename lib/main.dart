import 'package:flutter/material.dart';
import 'DatabaseConnection.dart';
import 'LoginPage.dart';
import 'package:eksamesprojekt_kiwi_app/DatabaseConnection.dart';

void main() async {

  Database.openConnection();
  WidgetsFlutterBinding.ensureInitialized();
  // Run the app
  runApp(MyApp());

  WidgetsBinding.instance?.addPostFrameCallback((_) {
    WidgetsBinding.instance?.addObserver(Database());
    WidgetsBinding.instance?.addObserver(_AppLifecycleStateObserver());
  });
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class _AppLifecycleStateObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      Database.closeConnection();
    }
    super.didChangeAppLifecycleState(state);
  }
}