import 'package:flutter/material.dart';
import 'package:plusvalia/core/widgets/app_main_button.dart';
import 'package:plusvalia/core/theme/app_colors.dart';

class ThirdPartyAuthenticationButton extends StatelessWidget {
  const ThirdPartyAuthenticationButton({
    super.key,
    required this.platfomLogo,
    required this.platfromName,
    required this.onPressed,
  });

  final String platfomLogo;
  final String platfromName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: AppMainButton(
          borderColor: AppColors.black.withOpacity(0.11),
          elevation: 6.0,
          elevationColor: AppColors.erieBlack.withOpacity(0.2),
          overlayColor: AppColors.gainsBoro,
          backgroundColor: AppColors.whiteSolid,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          onPressed: onPressed,
          child: Row(
            children: [
              Image.asset(platfomLogo),
              SizedBox(
                width: 20,
              ),
              Text(
                platfromName,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
