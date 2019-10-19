import 'package:flutter/material.dart';
import 'package:flutter_provider3/router/route_paths.dart';
import 'package:flutter_provider3/ui/views/home_view.dart';
import 'package:flutter_provider3/ui/views/login_view.dart';
import 'package:flutter_provider3/ui/views/post_view.dart';
import 'package:flutter_provider3/core/models/post.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.Post:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post:post));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
  }
}