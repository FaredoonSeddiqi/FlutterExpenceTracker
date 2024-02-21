import 'package:expencetracker/widget/expence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



var kschem = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255,96,59,181));
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((fun){
      runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData().copyWith(
        colorScheme: kschem,
        useMaterial3: true,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kschem.onPrimaryContainer,
          foregroundColor: kschem.primaryContainer,

        ),
        cardTheme: CardTheme().copyWith(
          color: kschem.secondaryContainer,
          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16)
        )
      ),
      
      home:expencepage(),
    );
  }
}
