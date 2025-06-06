import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Fluttertoast.showToast(
                                  msg: 'User name is ${nameController.text}',
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Text('Open BottomSheet'),
        ),
      ),
    );
  }
}
