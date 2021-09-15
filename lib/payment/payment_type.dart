import 'package:flutter/material.dart';

import 'payment_screen.dart';

class SelectPaymentType extends StatelessWidget {
  final double paymentValue;

  const SelectPaymentType({
    Key? key,
    required this.paymentValue,
  }) : super(key: key);
  String get formattedValue =>
      "R\$ ${paymentValue.toStringAsFixed(2).replaceFirst(".", ",")}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Selecione a forma de pagamento : ",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Text(
                formattedValue,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      paymentType: "CRÉDITO",
                      paymentValue: paymentValue,
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: Text(
                    "CRÉDITO",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      paymentType: "DÉBITO",
                      paymentValue: paymentValue,
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: Text(
                    "DÉBITO",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
