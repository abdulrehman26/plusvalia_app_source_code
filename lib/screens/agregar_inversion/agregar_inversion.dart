import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plusvalia/core/models/inversiones_model.dart';
import 'package:plusvalia/core/widgets/app_main_button.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:plusvalia/core/widgets/image_picker_button.dart';
import 'package:plusvalia/providers/inversiones_provider.dart';
import 'package:plusvalia/screens/agregar_inversion/widgets/agregar_inversion_form.dart';
import 'package:provider/provider.dart';

class AgregarInversion extends StatefulWidget {
  const AgregarInversion({super.key});

  @override
  State<AgregarInversion> createState() => _AgregarInversionState();
}

class _AgregarInversionState extends State<AgregarInversion> {
  File? lppimage;
  DateTime creationDate = DateTime.now();
  final TextEditingController conceptoController = TextEditingController();
  final TextEditingController costoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  showCustomSnakBar({
    required Color color,
    required String label,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.all(10.0),
        backgroundColor: color,
        content: Text(
          label,
          style: TextStyle(
            color: AppColors.whiteSolid,
          ),
        ),
      ),
    );
  }

  _onSubmit(InversionesProvider provider) {
    if (lppimage == null) {
      showCustomSnakBar(
        color: AppColors.red,
        label: 'subir imagen de propiedad',
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      String amount = costoController.text.replaceAll(RegExp(','), '');
      InversionesModel inversion = InversionesModel(
        photo: lppimage!,
        amount: double.tryParse(amount) ?? 0.0,
        title: conceptoController.text,
        date: creationDate,
      );
      provider.addNewInversion(inversion: inversion);
      showCustomSnakBar(
        color: AppColors.green,
        label: 'propiedad agregada a la lista de inversión',
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whileScale,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Agregar Inversión',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            fontSize: 16.0,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 29.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 55.0,
                  top: 20,
                ),
                child: ImagePickerButton(
                  image: lppimage,
                  onImagePicked: (image) {
                    setState(() {
                      lppimage = image;
                    });
                  },
                ),
              ),
              AgregarInversionForm(
                formKey: _formKey,
                creationDate: creationDate,
                conceptoController: conceptoController,
                costoController: costoController,
                ondateChanged: (date) {
                  creationDate = date;
                },
              ),
              _buildConfirmarButton(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildConfirmarButton(BuildContext context) {
    return Consumer<InversionesProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AppMainButton(
              backgroundColor: AppColors.black,
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 21.0),
              overlayColor: AppColors.whiteSolid.withOpacity(0.2),
              child: Text(
                'Confimar',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.whiteSolid,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                _onSubmit(provider);
              },
            ),
          ),
        );
      },
    );
  }
}
