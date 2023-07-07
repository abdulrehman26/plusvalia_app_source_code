import 'package:flutter/material.dart';
import 'package:plusvalia/core/widgets/app_main_button.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:plusvalia/screens/inversiones_screen/widgets/inversiones_list.dart';

class InversionesScreen extends StatelessWidget {
  const InversionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Column(
                children: [
                  Text(
                    'Mis Inversiones',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Expanded(child: InversionesList()),
                  SizedBox(height: 24.0),
                  _buildAgregarButton(context),
                  SizedBox(height: 100.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildAgregarButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AppMainButton(
        backgroundColor: AppColors.black,
        padding: EdgeInsets.all(23),
        overlayColor: AppColors.whiteSolid.withOpacity(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              'Agregar',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.whiteSolid,
                fontSize: 18.0,
              ),
            ),
            CircleAvatar(
              radius: 10.0,
              backgroundColor: AppColors.whiteSolid,
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 14.0,
                  color: AppColors.black,
                ),
              ),
            )
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/agregar_inersion');
        },
      ),
    );
  }
}
