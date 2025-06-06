import 'package:flutter/material.dart';

class TabExample extends StatefulWidget {
  const TabExample({super.key});

  @override
  State<TabExample> createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample> {
  bool isDarkMode = false;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Text(
          'My App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),

      ),


      // DefaultTabController(
      //   length: 3,
      //   child: Scaffold(
      //     appBar: AppBar(
      //       title: const Text(
      //         'My App',
      //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      //       ),
      //       centerTitle: true,
      //       backgroundColor: Colors.deepPurple,
      //       bottom: const TabBar(
      //         labelColor: Colors.white,
      //         unselectedLabelColor: Colors.white70,
      //         indicatorColor: Colors.white,
      //         indicatorWeight: 3,
      //         tabs: [
      //           Tab(icon: Icon(Icons.edit), text: 'Post'),
      //           Tab(icon: Icon(Icons.person), text: 'Profile'),
      //           Tab(icon: Icon(Icons.settings), text: 'Settings'),
      //         ],
      //       ),
      //     ),
      //     body: TabBarView(
      //       children: [
      //         const PostScreen(),
      //         const ProfileScreen(),
      //         SettingsScreen(
      //           isDarkMode: isDarkMode,
      //           onToggleDarkMode: toggleDarkMode, onThemeChanged: (bool ) {  },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
