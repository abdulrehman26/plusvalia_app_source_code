import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:plusvalia/core/utils/datepicker_dropdown.dart';

class AgregarInversionForm extends StatelessWidget {
  AgregarInversionForm({
    super.key,
    required this.formKey,
    required this.creationDate,
    required this.conceptoController,
    required this.costoController,
    required this.ondateChanged,
  });

  final DateTime creationDate;
  final TextEditingController conceptoController;
  final TextEditingController costoController;
  final GlobalKey<FormState> formKey;
  final Function(DateTime date) ondateChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormField(
            controller: conceptoController,
            label: 'Concepto',
            hintText: 'Alberca',
            suffixIcon: editIcon,
            validator: (value) {
              if (value == null || value.length == 0) {
                return 'Concepto es requerido';
              }
              return null;
            },
          ),
          _buildFormField(
            inputFormatter: [ThousandsFormatter()],
            controller: costoController,
            label: 'Costo',
            textInputType: TextInputType.number,
            hintText: '145,000.00',
            suffixIcon: editIcon,
            validator: (value) {
              if (value == null || value.length == 0) {
                return 'Costo es requerido';
              }
              return null;
            },
          ),
          Text(
            'Fecha',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 13.0),
          _buildDatePicker(),
        ],
      ),
    );
  }

  final Widget editIcon = Icon(
    Icons.edit,
    size: 20.0,
    color: AppColors.black,
  );

  _buildDatePicker() {
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
        selectedMonth: creationDate.month,
        selectedYear: creationDate.year,
        onChangedMonth: (value) {
          if (value != null) {
            DateTime date = DateTime.utc(
              creationDate.year,
              int.parse(value),
            );
            ondateChanged(date);
          }
        },
        onChangedYear: (value) {
          if (value != null) {
            DateTime date = DateTime.utc(
              int.parse(value),
              creationDate.month,
            );
            ondateChanged(date);
          }
        },
      ),
    );
  }

  _buildFormField({
    List<TextInputFormatter>? inputFormatter,
    TextInputType textInputType = TextInputType.text,
    required TextEditingController controller,
    required String label,
    required String hintText,
    required Widget suffixIcon,
    required FormFieldValidator<String>? validator,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 33.0),
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
          SizedBox(height: 18.0),
          TextFormField(
            inputFormatters: inputFormatter,
            controller: controller,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: AppColors.black),
            cursorColor: AppColors.black,
            validator: validator,
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: AppColors.independence),
              contentPadding:
                  EdgeInsets.only(top: 16, bottom: 16.0, left: 23, right: 16.0),
              hintText: hintText,
              filled: true,
              suffixIcon: suffixIcon,
              fillColor: AppColors.whiteSolid,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 0.5,
                  color: AppColors.red,
                ),
              ),
              errorStyle: TextStyle(
                fontSize: 14.0,
                color: AppColors.red,
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
