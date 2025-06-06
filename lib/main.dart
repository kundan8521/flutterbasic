import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: HomeScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeToggle: toggleTheme,
      ),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var isSwitchOn = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           height: 100,
//           child: Column(
//             children: [
//              Switch(value: isSwitchOn, onChanged: (value) {
//                value = isSwitchOn;
//              },),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Fluttertoast.showToast(msg: 'Login successfully');
//                 },
//                 child: Text('Login'),
//               ),
//               showDialog(context: context, builder: (context) {
//                 return AlertDialog(
//                   title: Text('Delete Account'),
//                   content:Text('Are you sure that you want to delete your acconunt ') ,
//                 ),
//               },),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

