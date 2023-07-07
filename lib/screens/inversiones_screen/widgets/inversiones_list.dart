import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plusvalia/core/models/inversiones_model.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:plusvalia/providers/inversiones_provider.dart';
import 'package:provider/provider.dart';

class InversionesList extends StatelessWidget {
  const InversionesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<InversionesProvider>(builder: (context, provider, child) {
      return provider.userInversiones.isEmpty
          ? Center(
              child: Text(
                'Agrega inversiones en mejoras de tu propiedad con el siguiente botón',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.independence,
                  fontSize: 16.0,
                ),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height / 2,
              child: GridView.builder(
                itemCount: provider.userInversiones.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 230,
                ),
                itemBuilder: (context, index) => _buildCard(
                  inversion: provider.userInversiones[index],
                ),
              ),
            );
    });
  }

  _buildCard({required InversionesModel inversion}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 58,
            backgroundColor: AppColors.gainsBoro,
            backgroundImage: FileImage(inversion.photo),
          ),
          SizedBox(height: 18.0),
          Text(
            "\$" +
                (inversion.amount > 1000000
                    ? NumberFormat.compactCurrency(name: '')
                        .format(inversion.amount)
                    : NumberFormat.currency(name: '').format(inversion.amount)),
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 9.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                children: [
                  Text(
                    '${inversion.title}',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    DateFormat.yMMM().format(inversion.date),
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.more_vert,
                size: 16.0,
                color: AppColors.black.withOpacity(0.5),
              )
            ],
          ),
        ],
      ),
    );
  }
}
