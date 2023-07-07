import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plusvalia/core/widgets/app_main_button.dart';
import 'package:plusvalia/core/constant/app_assets.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CallToActionCard extends StatelessWidget {
  const CallToActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteSolid,
      ),
      margin: EdgeInsets.only(bottom: 200.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildButton(
            mainColor: AppColors.black,
            icon: AppAssets.exclamationIcon,
            label: 'Plusvalía.App',
            onPressed: () async {
              Uri url = Uri.https('plusvalia.app');
              if (await canLaunchUrl(url)) launchUrl(url);
            },
            isSuffixVisible: true,
          ),
          _buildButton(
            mainColor: AppColors.red,
            icon: AppAssets.doorIcon,
            label: 'Salir',
            onPressed: () {
              exit(0);
            },
            isSuffixVisible: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 28.0,
              vertical: 25.0,
            ),
            child: Row(
              children: [
                SizedBox(width: 5.0),
                Spacer(),
                Text(
                  'Suscripción Anual \$ 99.00',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildButton({
    required Color mainColor,
    required bool isSuffixVisible,
    required String icon,
    required String label,
    required Function() onPressed,
  }) {
    return AppMainButton(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      elevationColor: mainColor.withOpacity(0.11),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: mainColor,
            height: 20.0,
          ),
          SizedBox(width: 20.0),
          Text(
            label,
            style: TextStyle(
              color: mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Visibility(
            visible: isSuffixVisible,
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
              size: 18.0,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
