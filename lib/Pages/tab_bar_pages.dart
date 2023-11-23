import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TabBarPages extends StatefulWidget {
  final List<Widget> pages;
  const TabBarPages({required this.pages, super.key});

  @override
  State<TabBarPages> createState() => _TabBarPagesState();
}

class _TabBarPagesState extends State<TabBarPages> {
  int _index = 0;

  void _setIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 8,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey[500],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GNav(
                color: Theme.of(context).colorScheme.outline,
                activeColor: Theme.of(context).colorScheme.outline,
                tabBackgroundColor: Theme.of(context).colorScheme.tertiary,
                padding: const EdgeInsets.all(10),
                gap: 8,
                onTabChange: (index) => _setIndex(index),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.list,
                    text: 'Ingredients',
                  ),
                  GButton(
                    icon: Icons.kitchen,
                    text: 'Recipe',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: widget.pages[_index],
    );
  }
}