import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_521028/navigation/app_routes.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ids = List.generate(200, (index) => index + 1);

    return WillPopScope(
      onWillPop: () async {
        final needClose = await showDialog<bool>(
          context: context,
          builder: (context) {
            return Dialog(
              child: Column(
                children: [
                  Text('Хотите покинуть экран?'),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () => context.pop(false),
                        child: Text('Нет'),
                      ),
                      FilledButton(
                        onPressed: () => context.pop(true),
                        child: Text('Да'),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );

        return needClose ?? false;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: ids.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => context.goNamed(
                AppRoutes.userDetails.name,
                // pathParameters: {'id': ids[index].toString()},
                queryParameters: {'id': ids[index].toString()},
                // extra: ids[index].toString(),
              ),
              child: Column(
                children: [
                  if (index != 0)
                    const Divider(
                      thickness: 2,
                      height: 2,
                      color: Colors.black,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      '${ids[index]}',
                      style: const TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
