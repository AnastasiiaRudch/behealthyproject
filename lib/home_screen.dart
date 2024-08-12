import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
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
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Be Healthy',
                  style: TextStyle(
                    // color: Colors.white,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(), // Adding space between logo and icons
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.local_fire_department_rounded, color: Theme.of(context).iconTheme.color),
              onPressed: () {
                // Action
              },
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.notifications, color: Theme.of(context).iconTheme.color),
              onPressed: () {
                // Action
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Main Content'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Active button
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
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
