import 'package:doctor/screens/add_medicine.dart';
import 'package:doctor/screens/home.dart';
import 'package:doctor/screens/report.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          Home(),
          Report(), 
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddMedicine()),
        ),
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 28, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          iconStyle: IconStyle.animated,
          iconSize: 28,
          opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
            title: const Text('Home'),
            backgroundColor: Colors.blue,
            unSelectedColor: Colors.grey, 
          ),
          BottomBarItem(
            icon: Icon(Icons.bar_chart, color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
            title: const Text('Report'),
            backgroundColor: Colors.blue,
            unSelectedColor: Colors.grey, 
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
