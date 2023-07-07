import 'package:flutter/cupertino.dart';
import 'package:plusvalia/core/models/inversiones_model.dart';

class InversionesProvider extends ChangeNotifier {
  List<InversionesModel> userInversiones = [];
  num userInversionesTotalAmount = 0;

  void addNewInversion({required InversionesModel inversion}) {
    userInversiones.add(inversion);
    calculateTotalInversionesAmount();
    notifyListeners();
  }

  void calculateTotalInversionesAmount() {
    userInversionesTotalAmount = 0;
    userInversiones.forEach(
      (inversion) {
        userInversionesTotalAmount += inversion.amount;
      },
    );
    notifyListeners();
  }
}
