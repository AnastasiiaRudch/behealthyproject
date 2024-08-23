import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calendar_screen.dart';
import 'trainings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;
  final List<Widget> _screens = [
    const Center(child: Text('Account Content')),
    const TrainingsScreen(),
    CalendarScreen(),
    const Center(child: Text('History Content')),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 130,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                // color: Colors.grey,
                color: theme.colorScheme.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Be Healthy',
                  style: TextStyle(
                    // color: Colors.white,
                    color: theme.colorScheme.onPrimaryContainer,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(), // Adding space between logo and icons
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.local_fire_department_rounded, color: theme.iconTheme.color),
              onPressed: () {
                // Action
              },
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.notifications, color: theme.iconTheme.color),
              onPressed: () {
                // Action
              },
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Active button
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dumbbell),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded, size: 28,),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article, size: 28,),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
