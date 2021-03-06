import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_architecture/locator.dart';
import 'package:flutter_provider_architecture/ui/router.dart';
import 'package:flutter_provider_architecture/ui/views/login_view.dart';
import 'package:flutter_provider_architecture/core/services/authentication_service.dart';

import 'core/models/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.controller(
      initialData: User.initial(),
      create: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: LoginView.routeName,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
