import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isSwitchOn = false;
  TextEditingController nameController = TextEditingController();
  String enteredName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // SizedBox(
              //   height: 100,
              //   child: Switch(value: isSwitchOn, onChanged: (value){
              //     isSwitchOn = value;
              //     setState(() {
              //
              //     });
              //   }),
              // ),
              SizedBox(
                height: 20,
                child: Switch(
                  value: isSwitchOn,
                  onChanged: (value) {
                    isSwitchOn = value;
                    setState(() {});
                  },
                ),
              ),
        
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: 'Login successfully',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },
                child: Text('Login'),
              ),
              SizedBox(height: 60),
              
              ElevatedButton(onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text('Account Delete'),
                    content: Text('Are sure to delete your account'),
                    actions: [
                      ElevatedButton(onPressed: () {
                        Fluttertoast.showToast(msg: 'account delete successfully');
                        
                      }, child: Text('Yes')),
                      ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                        
                      }, child: Text('No'))
                    ],
                    
                  );
                  
                },);
                
              }, child: Text('Show Alert Dialog')),
        
              // ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) {
              //         return AlertDialog(
              //           title: Text('Delete Account'),
              //           content: Text(
              //             "Are you sure that you want to delete your account",
              //           ),
              //           actions: [
              //             ElevatedButton(
              //               onPressed: () {
              //                 Fluttertoast.showToast(
              //                   msg: 'Account successfully delete',
              //                 );
              //               },
              //               child: Text('Yes'),
              //             ),
              //             ElevatedButton(
              //               onPressed: () {
              //                 Navigator.pop(context);
              //               },
              //               child: Text('No'),
              //             ),
              //           ],
              //         );
              //       },
              //     );
              //   },
              //   child: Text('Delete Account'),
              // ),
              SizedBox(height: 20),
              Text(enteredName, style: TextStyle(fontSize: 30)),
        
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Enter Name"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  var name = nameController.text.toString();
                  enteredName = name;
                  setState(() {});
        
                  Fluttertoast.showToast(msg: "You have entered:$name");
                },
                child: Text("click here"),
              ),
        
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete Account'),
                        content: Text(
                          'Are you sure that you want to delete your account',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                msg: 'Account deleted successfully',
                              );
                            },
                            child: Text("Yes"),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No'),
                          ),
                        ],
                      );
                      // return Dialog(
                      //   shape: BeveledRectangleBorder(
                      //     borderRadius:BorderRadius.circular(20),
                      //
                      //
                      //   ),
                      //   backgroundColor: Colors.white,
                      //   child: Column(
                      //     children: [
                      //       Text('Log out'),
                      //       Text('Are you sure that you want to logout'),
                      //       Row(
                      //         children: [
                      //           ElevatedButton(onPressed: (){}, child: Text('No'))
                      //         ],
                      //       )
                      //
                      //     ],
                      //   ),
                      // );
                    },
                  );
                },
                child: Text('Deleter Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
