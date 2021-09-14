import 'package:flutter/material.dart';

class PaymentValue extends StatelessWidget {
  final String name;

  const PaymentValue({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.red,
      body: Center(
        child: Text("Olá $name"),
      ),
    );
  }
}
