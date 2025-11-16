import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oncall_lab/core/constants/app_colors.dart';
import 'package:oncall_lab/ui/patient/home_screen.dart';
import 'package:oncall_lab/ui/patient/laboratories_screen.dart';
import 'package:oncall_lab/ui/patient/requests_screen.dart';
import 'package:oncall_lab/ui/patient/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  void _onTabSwitch(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> get pages => [
    PatientHomeScreen(onNavigateToProfile: () => _onTabSwitch(3)),
    const LaboratoriesScreen(),
    const PatientRequestsScreen(),
    const PatientProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black26,
        selectedItemColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home5),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.building),
            label: "Laboratory",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.calendar),
            label: "Requests",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
    );
  }
}
