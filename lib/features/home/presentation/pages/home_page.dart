import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BottomNavigationBarItem> _bNavBar = [
    const BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.calendarDays), label: 'Calendar',),
    const BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.check), label: 'Attendance',),
    const BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.solidUser), label: 'Account',),
  ];
  final List<Widget> _page = [];

  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(22),
            topLeft: Radius.circular(22),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -1),
              blurRadius: 1,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: _bNavBar,
          elevation: 10,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (value) => setState(() {
            _selectedItem = value;
          }),
          currentIndex: _selectedItem,
        ),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        child: _page[_selectedItem],
      ),
    );
  }
}
