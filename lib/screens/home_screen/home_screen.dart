import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plusvalia/core/constant/app_assets.dart';
import 'package:plusvalia/core/theme/app_colors.dart';
import 'package:plusvalia/screens/propiedad_screen/propiedad_screen.dart';
import 'package:plusvalia/screens/inversiones_screen/inversiones_screen.dart';
import 'package:plusvalia/screens/prefil_screen/prefil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    PerfilScreen(),
    PropiedadScreen(),
    InversionesScreen(),
  ];

  final PageController _pageController = PageController();
  int _currentIndex = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      ((_) {
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(microseconds: 100),
          curve: Curves.linear,
        );
      }),
    );
    super.initState();
  }

  _onNavBarButtonpressed(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.black,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                children: pages,
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: _buildCustomNavBar(
                currentIndex: _currentIndex,
                onNavBarButtonPressed: _onNavBarButtonpressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildCustomNavBar({
    required int currentIndex,
    required Function(int index) onNavBarButtonPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteSolid,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      padding: EdgeInsets.only(
        top: 15.0,
        left: 10.0,
        right: 0.0,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildNavBarIcon(
              iconPath: AppAssets.userIcon,
              currentIndex: currentIndex,
              index: 0,
            ),
            label: 'Mi Perfil',
          ),
          BottomNavigationBarItem(
            icon: _buildNavBarIcon(
              iconPath: AppAssets.houseIcon,
              currentIndex: currentIndex,
              index: 1,
            ),
            label: 'Mi Propiedad',
          ),
          BottomNavigationBarItem(
            icon: _buildNavBarIcon(
              iconPath: AppAssets.magicIcon,
              currentIndex: currentIndex,
              index: 2,
            ),
            label: 'Mis Inversiones',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: AppColors.black,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        onTap: _onNavBarButtonpressed,
      ),
    );
  }

  _buildNavBarIcon({
    required int index,
    required int currentIndex,
    required String iconPath,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: SvgPicture.asset(
        iconPath,
        height: 26,
        color: currentIndex == index ? AppColors.black : AppColors.independence,
      ),
    );
  }
}
