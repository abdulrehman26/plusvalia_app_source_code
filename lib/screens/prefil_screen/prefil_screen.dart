import 'package:flutter/material.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:plusvalia/screens/prefil_screen/widgets/call_to_action_card.dart';
import 'package:plusvalia/screens/prefil_screen/widgets/prefil_form.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            children: [
              Text(
                'Mi Perfil',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 38.0),
              PrefilForm(),
              CallToActionCard(),
            ],
          ),
        ),
      ),
    );
  }
}
