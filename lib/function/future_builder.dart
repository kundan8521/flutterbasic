import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicPractice extends StatefulWidget {
  const BasicPractice({super.key});

  @override
  State<BasicPractice> createState() => _BasicPracticeState();
}

class _BasicPracticeState extends State<BasicPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future builder'),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(child: Column(
        children: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);

          }, child: Text('Go back')),
          FutureBuilder(future: getData(), builder:(context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator(color: Colors.teal,),);

              }
            if(snapshot.hasError)
              {
                return Text(snapshot.data.toString());
              }
            return Text(snapshot.data.toString());
          },)
        ],
      )
      ),


    );
  }

  Future<String>getData() async {
    var result = await Future.delayed(Duration(seconds: 2),() {
      return 'Total product data  count is 100 ';
    },);
    return result;
  }


  }

