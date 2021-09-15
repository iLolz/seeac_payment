import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final double paymentValue;
  final String paymentType;
  const PaymentScreen({
    Key? key,
    required this.paymentValue,
    required this.paymentType,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  Color get containerColor {
    if (counter % 2 != 0) return Colors.grey.withOpacity(0.3);
    if (counter % 2 == 0) return Colors.green;
    return Colors.grey.withOpacity(0.3);
  }

  String get statusText {
    if (counter == 0) return "Aproxime para pagar!";
    if (counter > 0 && counter < 5) return "Efetuando pagamento!";
    if (counter > 4) return "Pagamento efetuado com sucesso!";
    return "Aproxime para pagar";
  }

  double get containerSize {
    if (counter < 6) {
      return (counter % 2) != 0 ? width * 0.4 : width * 0.8;
    }
    return width;
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              counter++;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            curve: Curves.bounceOut,
            onEnd: () {
              if (counter < 5) {
                setState(() {
                  counter++;
                });
              } else {
                setState(() {
                  if (counter < 6) counter++;
                });
              }
            },
            height: width == containerSize ? height : containerSize,
            width: containerSize,
            decoration: BoxDecoration(
              shape:
                  width == containerSize ? BoxShape.rectangle : BoxShape.circle,
              color: containerColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    Visibility(
                      visible: counter > 5,
                      child:
                          Icon(Icons.check, color: Colors.white, size: 48.00),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
