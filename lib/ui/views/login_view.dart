import 'package:flutter/material.dart';

import 'package:flutter_provider_architecture/ui/views/home_view.dart';
import 'package:flutter_provider_architecture/ui/shared/app_colors.dart';
import 'package:flutter_provider_architecture/core/enums/view_state.dart';
import 'package:flutter_provider_architecture/ui/widgets/login_header.dart';
import 'package:flutter_provider_architecture/core/view_models/login_model.dart';

import 'base_view.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
              validationMessage: model.errorMessage,
              controller: _controller,
            ),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, HomeView.routeName);
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
