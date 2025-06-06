import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicFunction extends StatefulWidget {
  const BasicFunction({super.key});

  @override
  State<BasicFunction> createState() => _BasicFunctionState();
}

class _BasicFunctionState extends State<BasicFunction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              StreamBuilder(stream: getCounterData(), builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },)
            ],
          ),
        ),
      ),

    );
  }
}
Stream<int>getCounterData(){
  return Stream.periodic(Duration(seconds: 2),(computationCount) => computationCount,);

}