import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:plusvalia/core/utils/datepicker_dropdown.dart';
import 'package:plusvalia/providers/annual_cadastral_capital_provider.dart.dart';
import 'package:provider/provider.dart';

class PrefilForm extends StatefulWidget {
  const PrefilForm({super.key});

  @override
  State<PrefilForm> createState() => _PrefilFormState();
}

class _PrefilFormState extends State<PrefilForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<AnnualCadastralCapitalProvider>(
            builder: (context, provider, child) {
              return _buildFormField(
                label: 'Nombre propiedad',
                isTextFieldEnabled: true,
                initalValue: provider.nombrePropiedad,
                hintText: 'Casa Colorines',
                suffixIcon: editIcon,
                onChanged: (value) {
                  provider.updateNombrePropieda(value);
                },
              );
            },
          ),
          Consumer<AnnualCadastralCapitalProvider>(
            builder: (context, provider, child) {
              return _buildFormField(
                inputFormatter: [ThousandsFormatter()],
                label: 'Valor Avalúo',
                isTextFieldEnabled: true,
                initalValue: provider.valorAvaluo == 0.0
                    ? null
                    : '\$ ${provider.valorAvaluo}',
                hintText: '\$ 2,850,000.00',
                suffixIcon: editIcon,
                onChanged: (value) {
                  String amount = value.replaceAll(RegExp(','), '');
                  provider.updateValorAvaluo(
                    num.tryParse(amount) ?? 0.0,
                  );
                },
              );
            },
          ),
          SizedBox(height: 2.0),
          Text(
            'Fecha Avalúo',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 15.0),
          _buildDataPicker(),
          SizedBox(height: 32.8),
          Center(
            child: Text(
              'Plusvalía Catastral Anual',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Porcentaje Sugerido:',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Consumer<AnnualCadastralCapitalProvider>(
                      builder: (context, provider, child) {
                        return Text(
                          DateFormat.yMMM().format(provider.fechaAvaluo) +
                              ' | ${provider.porcentajeSugerido}%',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: AppColors.black.withOpacity(0.5),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Consumer<AnnualCadastralCapitalProvider>(
                  builder: (context, provider, child) {
                    return Flexible(
                      child: _buildFormField(
                        label: '',
                        isTextFieldEnabled: true,
                        hintText: '7.7',
                        initalValue: provider.valorAvaluo == 0.0
                            ? null
                            : '\$ ${provider.fechaAvaluo}',
                        suffixIcon: editIcon,
                        onChanged: (val) {
                          provider.updatePorcentajeSugerido(num.parse(val));
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  final Widget editIcon = Icon(
    Icons.edit,
    size: 20.0,
    color: AppColors.black,
  );

  _buildDataPicker() {
    return Consumer<AnnualCadastralCapitalProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.only(right: 80.0),
          child: DropdownDatePicker(
            boxDecoration: BoxDecoration(
              color: AppColors.whiteSolid,
              borderRadius: BorderRadius.circular(80.0),
            ),
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: AppColors.black.withOpacity(0.7),
            ),
            inputDecoration: InputDecoration(
              border: InputBorder.none,
            ),
            showDay: false,
            startYear: 1900,
            endYear: DateTime.now().year,
            selectedMonth: provider.fechaAvaluo.month,
            selectedYear: provider.fechaAvaluo.year,
            onChangedMonth: (value) {
              if (value != null) {
                DateTime date = DateTime.utc(
                  provider.fechaAvaluo.year,
                  int.parse(value),
                );
                provider.updateFechaAvaluo(date);
              }
            },
            onChangedYear: (value) {
              if (value != null) {
                DateTime date = DateTime.utc(
                  int.parse(value),
                  provider.fechaAvaluo.month,
                );
                provider.updateFechaAvaluo(date);
              }
            },
          ),
        );
      },
    );
  }

  _buildFormField({
    List<TextInputFormatter>? inputFormatter,
    TextInputType textInputType = TextInputType.text,
    String? initalValue = null,
    bool isTextFieldEnabled = true,
    required String label,
    required String hintText,
    required Widget suffixIcon,
    required Function(dynamic value) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            inputFormatters: inputFormatter,
            cursorColor: AppColors.black,
            initialValue: initalValue,
            onChanged: onChanged,
            enabled: isTextFieldEnabled,
            keyboardType: textInputType,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: AppColors.black),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: AppColors.independence),
              contentPadding: EdgeInsets.only(
                top: 16,
                bottom: 16.0,
                left: 23,
                right: 16.0,
              ),
              hintText: hintText,
              filled: true,
              suffixIcon: suffixIcon,
              fillColor: AppColors.whiteSolid,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(
      text: NumberFormat.compactCurrency(name: '').format(newValue),
    );
  }
}
