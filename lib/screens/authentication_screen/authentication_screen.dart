import 'package:flutter/material.dart';
import 'package:plusvalia/core/widgets/app_main_button.dart';
import 'package:plusvalia/core/constant/app_assets.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:plusvalia/screens/authentication_screen/widget/third_party_auth_button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingresar',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20.0),
                ThirdPartyAuthenticationButton(
                  platfomLogo: AppAssets.googleLogo,
                  platfromName: 'Continue with Google',
                  onPressed: () {},
                ),
                ThirdPartyAuthenticationButton(
                  platfomLogo: AppAssets.facebookLogo,
                  platfromName: 'Continue with Facebook',
                  onPressed: () {},
                ),
                ThirdPartyAuthenticationButton(
                  platfomLogo: AppAssets.instagramLogo,
                  platfromName: 'Continue with Instagram',
                  onPressed: () {},
                ),
                SizedBox(height: 20.0),
                _buildSkipAuthenticationButton(context),
                Spacer(),
                Center(child: Image.asset('assets/images/logoBlack.png')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkipAuthenticationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: AppMainButton(
          borderColor: AppColors.black.withOpacity(0.11),
          elevation: 6.0,
          elevationColor: AppColors.erieBlack.withOpacity(0.4),
          overlayColor: AppColors.whiteSolid.withOpacity(0.11),
          backgroundColor: AppColors.black,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Center(
            child: Text(
              'Skip Registration',
              style: TextStyle(
                color: AppColors.whiteSolid,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
