import 'package:flutter/material.dart';

class TabExample extends StatefulWidget {
  const TabExample({super.key});

  @override
  State<TabExample> createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tab Example',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: [Tab(text: 'Tab 1'), Tab(text: 'Tab 2'), Tab(text: 'Tab 3')],
          ),
        ),
        body: const TabBarView(
          children: [
            // Tab1(),
            Center(
              child: Text('Content for Tab 1', style: TextStyle(fontSize: 18)),
            ),
            Center(
              child: Text('Content for Tab 2', style: TextStyle(fontSize: 18)),
            ),
            Center(
              child: Text('Content for Tab 3', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// class Tab1 extends StatelessWidget {
//   const Tab1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey[100],
//       padding: const EdgeInsets.all(16),
//       child: Center(
//         child: Card(
//           elevation: 8,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   'Welcome to Tab 1',
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.send),
//                   label: const Text('Post', style: TextStyle(fontSize: 16)),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12,
//                       horizontal: 24,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
