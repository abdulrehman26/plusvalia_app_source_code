import 'package:flutter/cupertino.dart';

class AnnualCadastralCapitalProvider extends ChangeNotifier {
  String? nombrePropiedad;
  num valorAvaluo = 0.0;
  num porcentajeSugerido = 7.7;
  DateTime fechaAvaluo = DateTime.now();
  DateTime currentDate = DateTime.now();

  num numberOfMonths = 0;
  num monthTaxes = 0;
  num results = 0;
  num totalAmount = 0;

  calcFinal() {
    numberOfMonths = (currentDate.difference(fechaAvaluo).inDays / 30).toInt();
    monthTaxes = (valorAvaluo * (porcentajeSugerido / 100) / 12).toDouble();
    results = (monthTaxes * numberOfMonths);
    totalAmount = results + valorAvaluo;
  }

  fromulaCalculation() {
    // ignore: division_optimization
    numberOfMonths = (currentDate.difference(fechaAvaluo).inDays / 30).toInt();

    monthTaxes = (valorAvaluo * (porcentajeSugerido / 100) / 12);

    results = (monthTaxes * numberOfMonths);

    totalAmount = results + valorAvaluo;
  }

  void updateNombrePropieda(String nombre) {
    nombrePropiedad = nombre;
    notifyListeners();
  }

  void updateValorAvaluo(num avaluo) {
    valorAvaluo = avaluo;
    fromulaCalculation();
    notifyListeners();
  }

  void updateFechaAvaluo(DateTime fecha) {
    fechaAvaluo = fecha;
    fromulaCalculation();
    notifyListeners();
  }

  void updatePorcentajeSugerido(num porcentaj) {
    porcentajeSugerido = porcentaj;
    fromulaCalculation();
    notifyListeners();
  }
}
