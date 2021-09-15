class PaymentValueController {
  String? validateValue(String? value) {
    if (value != null) {
      String valorCompra =
          value.replaceAll("R\$ ", "").replaceAll(".", "").replaceAll(",", ".");

      double? _value = double.tryParse(valorCompra);

      if (_value != null && _value > 0) {
        return null;
      } else {
        return "Digite o valor da compra!";
      }
    }
    return "Digite o valor da compra!";
  }

  double getValue(String value) => double.parse(
      value.replaceAll("R\$ ", "").replaceAll(".", "").replaceAll(",", "."));
}
