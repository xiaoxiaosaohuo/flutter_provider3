import 'package:flutter/material.dart';
import 'package:flutter_provider3/core/services/authentication_service.dart';
import 'package:flutter_provider3/core/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {

  AuthenticationService _authenticationService;

  LoginViewModel({ @required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}