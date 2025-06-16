import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Detailed'),
      ),
      body: Center(
        child: Container(
          child: Hero(tag: 'background', child: Image.asset('assets/images/login_screen.jpeg')),
        ),
      ),
    );
  }
}
