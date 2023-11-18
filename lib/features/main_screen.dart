import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_521028/navigation/app_routes.dart';

class MainScreen extends StatefulWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const mainPaths = [
    AppRoutes.news,
    AppRoutes.search,
    AppRoutes.user,
  ];

  int getCurrentIndex(BuildContext context) {
    final path = GoRouterState.of(context).uri.toString();

    return mainPaths.indexWhere((element) => path.startsWith(element.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => context.goNamed(mainPaths[index].name),
        currentIndex: getCurrentIndex(context),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          )
        ],
      ),
    );
  }
}
