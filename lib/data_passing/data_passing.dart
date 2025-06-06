import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasic/data_passing/product_screen.dart';

class DataPassing extends StatefulWidget {
  const DataPassing({super.key});

  @override
  State<DataPassing> createState() => _DataPassingState();
}

class _DataPassingState extends State<DataPassing> {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Passing')),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              ProductScreen(name: nameController.text, age: 15),
                    ),
                  );
                  if (result != '' && result != null) {
                    nameController.text = result;
                    setState(() {});
                  }
                },
                child: Center(child: Text('Go to product screen')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
