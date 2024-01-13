import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        title: const Column(
          children: [
            Text(
              "Hi Junior \nTraveling today?",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Text('1'),
          Text('2'),
          Text('3'),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (context, pageIndex, child) {
            return BottomNavigationBar(
              currentIndex: pageIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: "My trips"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), label: "Add trips"),
                BottomNavigationBarItem(icon: Icon(Icons.map), label: "Maps")
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            );
          }),
    );
  }
}
