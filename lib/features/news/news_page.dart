import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_521028/navigation/app_routes.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('NewsPage'),
              FilledButton(
                // onPressed: () => context.pushNamed(AppRoutes.user.name),
                onPressed: () => context.goNamed(AppRoutes.user.name),
                child: Text('Go users'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
