import 'package:flutter/material.dart';

class iQueChumbeiScreen extends StatefulWidget {

  final List<Widget> screens;
  final List<BottomNavigationBarItem> items;

  const iQueChumbeiScreen({Key? key, required this.screens, required this.items}) : super (key: key);

  @override
  State<iQueChumbeiScreen> createState() => _iQueChumbeiScreenState();

}

class _iQueChumbeiScreenState extends State<iQueChumbeiScreen> {

  int _pageIndex = 0;
  void _onTapped(int newPageIndex) {
    setState(() {
      _pageIndex = newPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        currentIndex: _pageIndex,
        onTap: _onTapped,
        items: widget.items,
      ),
    );
  }

}