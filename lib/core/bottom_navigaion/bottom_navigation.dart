import 'package:flutter/material.dart';
import 'package:tastehub/core/utils/colors.dart';
import 'package:tastehub/features/cart/screens/cart_screen.dart';

import '../../features/explore/screens/explore_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../widgets/svg_icon.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [ExploreScreen(), CartScreen(pad: 100.0,), ProfileScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screens[_selectedIndex],
          Positioned(
            left: 30,
            right: 30,
            bottom: 50,
            child: _buildCustomNavBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomNavBar() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 3,
            spreadRadius: 2,
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem("assets/svg/home.svg", 0),
          _navItem("assets/svg/cart.svg", 1),
          _navItem("assets/svg/profile.svg", 2),
        ],
      ),
    );
  }

  Widget _navItem(String icon, int index) {
    bool isSelected = _selectedIndex == index;
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primMain : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: SvgIcon(
            icon: icon,
            color: isSelected ? AppColors.primWhite : AppColors.primLightGrey,
          ),
        ),
      ),
    );
  }
}
