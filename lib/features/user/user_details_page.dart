import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserDetailsPage extends StatefulWidget {
  final String id;

  const UserDetailsPage({
    required this.id,
    super.key,
  });

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(GoRouterState.of(context).uri.toString());

    return Scaffold(
      appBar: AppBar(
        // leading: InkWell(
        //   onTap: (){},
        //   child:  Icon(Icons.arrow_back_ios),
        // ),
      ),
      body: Center(
        child: Text('User id: ${widget.id}'),
      ),
    );
  }
}
