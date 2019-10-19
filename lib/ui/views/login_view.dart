import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider3/core/viewmodels/login_view_model.dart';
import 'package:flutter_provider3/ui/widgets/login_header.dart';
import 'package:flutter_provider3/router/route_paths.dart';
import 'package:flutter_provider3/ui/views/base_widget.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
        authenticationService:Provider.of(context)
      ),
      child:LoginHeader(controller: _controller),
      builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.blue,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child,
                FlatButton(
                    color: Colors.white,
                    child:  model.busy 
                      ? CircularProgressIndicator(backgroundColor:Colors.redAccent,)
                      : Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    onPressed: ()async{
                      var loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, RoutePaths.Home);
                      }
                    }
                ),

              ],
            )
        ),
    );
  }
}