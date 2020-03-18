import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/ui/views/home_view.dart';
import 'package:flutter_provider_architecture/ui/views/login_view.dart';
import 'package:flutter_provider_architecture/ui/views/post_view.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => HomeView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => LoginView());
      case PostView.routeName:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
