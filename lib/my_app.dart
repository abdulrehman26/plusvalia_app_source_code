import 'package:flutter/material.dart';
import 'package:plusvalia/core/router/app_router.dart';
import 'package:plusvalia/core/theme/app_theme.dart';
import 'package:plusvalia/providers/inversiones_provider.dart';
import 'package:plusvalia/providers/user_profile_photo_provider.dart';
import 'package:provider/provider.dart';

import 'providers/annual_cadastral_capital_provider.dart.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter _appRoutes = AppRouter();
    return MultiProvider(
      providers: [
        ListenableProvider<UserProfilePhotoProvider>(
          create: (_) => UserProfilePhotoProvider(),
        ),
        ListenableProvider<AnnualCadastralCapitalProvider>(
          create: (_) => AnnualCadastralCapitalProvider(),
        ),
        ListenableProvider<InversionesProvider>(
          create: (_) => InversionesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Plusvalia',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        onGenerateRoute: _appRoutes.onGenerateRoute,
      ),
    );
  }
}
