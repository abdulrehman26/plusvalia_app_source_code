import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plusvalia/core/constant/app_assets.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:plusvalia/providers/annual_cadastral_capital_provider.dart.dart';
import 'package:plusvalia/providers/inversiones_provider.dart';
import 'package:plusvalia/providers/user_profile_photo_provider.dart';
import 'package:plusvalia/screens/propiedad_screen/models/month_summary_model.dart';
import 'package:plusvalia/screens/propiedad_screen/widgets/revenue_summary_card.dart';

import 'package:plusvalia/core/widgets/image_picker_button.dart';
import 'package:provider/provider.dart';

class PropiedadScreen extends StatelessWidget {
  const PropiedadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.appLogoSmall,
                height: 20.0,
                width: 103,
              ),
              SizedBox(height: 26.0),
              Consumer<AnnualCadastralCapitalProvider>(
                builder: (context, provider, child) {
                  return Text(
                    provider.nombrePropiedad ?? ' Nombre Propiedad',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  );
                },
              ),
              Consumer<UserProfilePhotoProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 38),
                    child: ImagePickerButton(
                      image: provider.profilePhoto,
                      onImagePicked: (image) {
                        provider.updateProfilePhoto(photo: image);
                      },
                    ),
                  );
                },
              ),
              Consumer<AnnualCadastralCapitalProvider>(
                builder: (context, provider, child) {
                  ;
                  return Text(
                    "\$" +
                        (provider.totalAmount > 1000000
                            ? NumberFormat.compactCurrency(name: '')
                                .format(provider.totalAmount)
                            : NumberFormat.currency(name: '')
                                .format(provider.totalAmount)),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      fontSize: 30.0,
                    ),
                  );
                },
              ),
              SizedBox(height: 13.0),
              Text(
                'Valor Comercial Estimado',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Inversiones no consideradas',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.black.withOpacity(0.5),
                  fontSize: 10.0,
                ),
              ),
              SizedBox(height: 50.0),
              Consumer<AnnualCadastralCapitalProvider>(
                builder: (context, provider, child) {
                  num rev1 = provider.totalAmount - provider.monthTaxes;
                  num rev2 = rev1 - provider.monthTaxes;
                  num rev3 = rev2 - provider.monthTaxes;
                  return RevenueSummaryCard(
                    leadingText: 'Plusvalía Catastral',
                    suffixText: '7.7%',
                    monthsSummary: [
                      RevenueSummaryModel(
                        date: provider.fechaAvaluo,
                        total: rev1,
                        indicatorColor: AppColors.green,
                      ),
                      RevenueSummaryModel(
                        date: provider.fechaAvaluo.subtract(Duration(days: 30)),
                        total: rev2,
                        indicatorColor: AppColors.red,
                      ),
                      RevenueSummaryModel(
                        date: provider.fechaAvaluo.subtract(Duration(days: 60)),
                        total: rev3,
                        indicatorColor: AppColors.red,
                      )
                    ],
                  );
                },
              ),
              SizedBox(height: 20.0),
              Consumer<InversionesProvider>(
                  builder: (context, provider, child) {
                return RevenueSummaryCard(
                  leadingText: 'Mis Inversiones',
                  suffixText: 'Total',
                  monthsSummary: [
                    RevenueSummaryModel(
                      date: DateTime.now(),
                      total: provider.userInversionesTotalAmount,
                      indicatorColor: AppColors.yellow,
                    ),
                  ],
                );
              }),
              SizedBox(height: 100.0)
            ],
          ),
        ),
      ),
    );
  }
}
