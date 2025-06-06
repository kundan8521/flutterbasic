import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Account Delete'),
                content: Text('Are sure to delete your account'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: 'account delete successfully',
                      );
                    },
                    child: Text('Yes'),
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('No')),
                ],
              );
            },
          );
        },
        child: Text('alert dialog'),
      ),
    );
  }
}
