// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Product extends StatefulWidget {
//   const Product({super.key});
//
//   @override
//   State<Product> createState() => _ProductState();
// }
//
// class _ProductState extends State<Product> {
//   void initState() {
//     getView();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
//
//   // Future<void> getProduct() async {
//   //   Future.delayed(Duration(seconds: 2), () {
//   //     print("Product is loaded");
//   //   });
//   // }
//   Future<void> getProduct()async{
//     Future.delayed(Duration(seconds: 1));
//     print('first task');
//
//   }
//
//   Future<void> getCart() async {
//     Future.delayed(Duration(seconds: 1), () {
//       print("Cart is loaded");
//     });
//   }
//
//   Future<void> getView() async {
//     getProduct().then((value) {
//       getCart();
//     });
//     await getCart();
//   }
// }

class Product {
  Future<void> getData() async {
    Future.delayed(Duration(seconds: 2), () {
      print('Product is loaded');
    });
  }

  void setData() async {
    Future.delayed(Duration(seconds: 1), () {
      print('cart is loaded');
    });
  }
}

Future<String> getData() async {
  await Future.delayed(Duration(seconds: 3), () {
    print('first task');
  });

  return 'Task is done';
}

user() {
  Future.delayed(Duration(seconds: 2), () {
    print('Second Task');
  });
}

void main() async {
  await getData().then((value) {
    print(value);
  });
  user();
}
