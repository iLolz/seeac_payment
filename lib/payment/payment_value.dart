import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:payment_app/payment/payment_valu_controller.dart';

class PaymentValue extends StatefulWidget {
  final String name;

  const PaymentValue({Key? key, required this.name}) : super(key: key);

  @override
  State<PaymentValue> createState() => _PaymentValueState();
}

class _PaymentValueState extends State<PaymentValue> {
  final _controller = MoneyMaskedTextController(leftSymbol: "R\$ ");

  final controller = PaymentValueController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("Digite o valor do pagamento:"),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 16.0,
              ),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    labelText: "Valor da compra",
                    suffix: InkWell(
                      child: const Icon(Icons.close),
                      onTap: () {
                        _controller.clear();
                      },
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => controller.validateValue(value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text("Confirmar valor"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  } else {
                    showAboutDialog(
                      context: context,
                      children: const [
                        Text("Valor inválido!"),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
