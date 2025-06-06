import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionMenu extends StatefulWidget {
  const OptionMenu({super.key});

  @override
  State<OptionMenu> createState() => _OptionMenuState();
}

class _OptionMenuState extends State<OptionMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder:
                (context) => [
                  PopupMenuItem(child: Text('Setting'), value: 'Setting'),
                  PopupMenuItem(child: Text('Update'), value: 'Setting'),
                ],
            onSelected: (value) {
              if (value == 'Setting') {
                print(value);
              }
            },
          ),

        ],
        backgroundColor: Colors.teal
        ,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showMenu(
                  position: RelativeRect.fromLTRB(100, 100, 50, 50),
                  context: context,
                  items: [
                    PopupMenuItem(child: Text('Status'), value: 'Status'),
                    PopupMenuItem(child: Text('Setting'), value: 'Setting'),
                  ],
                ).then((value) {
                  if (value == 'Status') {
                    print(value);
                  }
                });
              },
              child: Text('Menu Button'),
            ),
            ListView.builder(
              itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              itemBuilder: (context, index) {
                return ListTile(
                  trailing: PopupMenuButton(
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(child: Text('Setting')),
                          PopupMenuItem(child: Text('Update')),
                          PopupMenuItem(child: Text('Edit')),
                        ],
                    onSelected: (value) {
                      print(value);
                    },
                  ),
                  title: Text('Item $index'),
                );
              },
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     showMenu(
            //       position: RelativeRect.fromLTRB(150, 100, 50, 50),
            //       context: context,
            //       items: [
            //         PopupMenuItem(child: Text('Status'), value: '1'),
            //         PopupMenuItem(child: Text('Setting'), value: '2'),
            //       ],
            //     ).then((value) {
            //       if (value == '1') {
            //         print(value);
            //       }
            //     });
            //   },
            //   child: Text('Menu Button'),
            // ),
          ],
        ),
      ),

      // ListView.builder(
      //
      //   itemCount: 10,
      //   shrinkWrap: true,
      //   physics: NeverScrollableScrollPhysics(),
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       trailing: PopupMenuButton(
      //         itemBuilder:
      //             (context) => [
      //           PopupMenuItem(child: Text('Update'), value: 'Update'),
      //           PopupMenuItem(child: Text('Delete'), value: 'Delete'),
      //         ],
      //
      //         onSelected:(value) {
      //           print(value);
      //         },
      //
      //       ),
      //       title: Text('Item $index'),
      //     );
      //   },
      // ),

      // body: AppBar(
      //   actions: [
      //     PopupMenuButton(
      //       itemBuilder:
      //           (context) => [
      //             PopupMenuItem(child: Text('Status'), value: 'Status'),
      //             PopupMenuItem(child: Text('Status'), value: 'Setting'),
      //           ],
      //       onSelected: (value) {
      //         if (value == 'Status') {
      //           print(value);
      //         }
      //       },
      //     ),
      //   ],
      // ),
      //
    );
  }
}
