import 'package:firstcrud/providers/UsersProvider.dart';
import 'package:firstcrud/routes/AppRoutes.dart';
import 'package:firstcrud/views/user/UserFormView.dart';
import 'package:firstcrud/views/user/UserListView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(FirstCrudApp());
}

class FirstCrudApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UsersProvider()
        ),
      ],
      child: MaterialApp(
        title: 'First Crud App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserListView(),
          AppRoutes.USER_FORM: (_) => UserFormView(),
        }
      ),
    );
  }
}
