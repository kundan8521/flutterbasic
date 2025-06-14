import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          PopupMenuButton(
            itemBuilder:
                (context) => [
                  PopupMenuItem(child: Text('Cart'), value: 'Cart'),
                  PopupMenuItem(child: Text('Orders'), value: 'Orders'),
                  PopupMenuItem(child: Text('WishList'), value: 'WishList'),
                  PopupMenuItem(child: Text('Cart'), value: 'Cart'),
                  PopupMenuItem(child: Text('Cart'), value: 'Cart'),
                ],
            onSelected: (value) {
              if (value == 'Cart') {
                print(value);
              }
            },
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Center(
            // child: ElevatedButton(
            //   onPressed: () {
            //     showMenu(
            //       position: RelativeRect.fromLTRB(150, 100, 0, 0),
            //       context: context,
            //       items: [
            //         PopupMenuItem(child: Text('Add'), value: 'Add'),
            //         PopupMenuItem(child: Text('Add'), value: 'Add'),
            //         PopupMenuItem(child: Text('Add'), value: 'Add'),
            //       ],
            //     ).then((value) {
            //       if (value == 'Add') {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => OptionMenu()),
            //         );
            //         print(value);
            //       }
            //     });
            //   },
            //   child: Text('Show Context Menu'),
            // ),

            // child: ElevatedButton(onPressed: () {
            //   showMenu(context: context, items: [
            //     PopupMenuItem(child: Text('setting'),value: 'setting',),
            //     PopupMenuItem(child: Text('setting'),value: 'setting',),
            //     PopupMenuItem(child: Text('setting'),value: 'setting',),
            //   ]
            //   ).then((value) {
            //     if(value == 'setting'){
            //       print(value);
            //     }
            //   },);
            // } , child: Text('Context Menu')),
            child: ElevatedButton(
              onPressed: () {
                showMenu(
                  context: context,
                  items: [
                    PopupMenuItem(child: Text('Setting'), value: 'setting'),
                    PopupMenuItem(child: Text('Log out'), value: 'log out'),
                  ],
                ).then((value) {
                  if(value == 'setting'){
                    print(value);
                  }
                },);
              },
              child: Text('Show context menu'),
            ),
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                trailing: PopupMenuButton(
                  itemBuilder:
                      (context) => [
                        PopupMenuItem(child: Text('Setting'), value: 'setting'),
                        PopupMenuItem(child: Text('Status'), value: 'setting'),
                        PopupMenuItem(child: Text('Help'), value: 'setting'),
                        PopupMenuItem(child: Text('Log out'), value: 'setting'),
                      ],
                  onSelected: (value) {
                    if (value == 'setting') {
                      print(value);
                    }
                  },
                ),
                title: Text('Item $index'),
              );
            },
          ),
          // ListView.builder(
          //   itemCount: 10,
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       trailing: PopupMenuButton(
          //         itemBuilder:
          //             (context) => [`
          //               PopupMenuItem(child: Text('Update'), value: 'Update'),
          //               PopupMenuItem(child: Text('Delete'), value: 'Delete'),
          //             ],
          //
          //         onSelected: (value) {
          //           print(value);
          //         },
          //       ),
          //       title: Text('Item $index'),
          //     );
          //   },
          // ),
          // ListView.builder(
          //   itemCount: 10,
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       trailing: PopupMenuButton(
          //         itemBuilder:
          //             (context) => [
          //               PopupMenuItem(child: Text('Setting'), value: '1'),
          //               PopupMenuItem(child: Text('Status')),
          //             ],
          //         onSelected: (value) {
          //           if (value == '1') {
          //             print(value);
          //           }
          //         },
          //       ),
          //       title: Text('Item $index'),
          //     );
          //   },
          // ),
          // ListView.builder(
          //   itemCount: 10,
          //   shrinkWrap: true,
          //
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       trailing: PopupMenuButton(
          //         itemBuilder:
          //             (context) => [
          //               PopupMenuItem(child: Text('Status'), value: 'Status'),
          //               PopupMenuItem(child: Text('Setting'), value: 'Status'),
          //             ],
          //         onSelected: (value) {
          //           if (value == 'Status') {
          //             print(value);
          //           }
          //         },
          //       ),
          //       title: Text('Item $index'),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
