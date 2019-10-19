import 'package:flutter/material.dart';
import 'package:flutter_provider3/ui/shared/ui_helpers.dart';
import 'package:flutter_provider3/ui/shared/text_styles.dart';


class LoginHeader extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;

  const LoginHeader({Key key,this.controller,this.validationMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('login',style:headerStyle,),
        UIHelper.verticalSpaceMedium,
        Text('enter a number 1-9',style: subHeaderStyle,),
        _buildLoginTextField(),
        this.validationMessage !=null
          ? Text(validationMessage,style: TextStyle(color:Colors.red),)
          :Container()
      ],
    );
  }
  _buildLoginTextField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: 'User Id'),
        controller: controller,
      ),
    );
  }
}

