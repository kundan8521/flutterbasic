import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),

            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 140,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 140,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 150,
                        width: 340,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 150,
                            width: 95,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 130,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 110,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
