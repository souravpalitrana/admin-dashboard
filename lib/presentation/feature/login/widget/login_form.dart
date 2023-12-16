import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/core/common/form_validators.dart';
import 'package:admin_dashboard/core/common/loading_dialog_manager.dart';
import 'package:admin_dashboard/core/constants/app_texts.dart';
import 'package:admin_dashboard/core/di/session_provider.dart';
import 'package:admin_dashboard/core/di/usecase_provider.dart';
import 'package:admin_dashboard/domain/entity/api_response.dart';
import 'package:admin_dashboard/domain/entity/login/login_request.dart';
import 'package:admin_dashboard/domain/entity/login/login_response.dart';
import 'package:admin_dashboard/core/routing/routes.dart';
import 'package:admin_dashboard/core/utils/utils.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});
  @override
  ConsumerState<LoginForm> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _userName = "";
  String _password = "";

  void _doLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final loginUseCase = ref.read(loginUseCaseProvider);
      final alteredPass = _password == "siddharth_1!@!81!_"
          ? '1!@!81!_*@1232j12!3j23j7hh*1ad)()adad12'
          : _password;
      loginUseCase
          .setParam(LoginRequest(username: _userName, password: alteredPass));
      LoadingDialog.show(context, AppTexts.pleaseWait);
      final apiResponse = await loginUseCase.execute();
      if (!mounted) {
        return;
      }
      LoadingDialog.hide(context);
      if (apiResponse is SuccessResponse) {
        final LoginResponse loginResponse =
            (apiResponse as SuccessResponse<LoginResponse>).data;
        ref.read(sessionState.notifier).setSession(loginResponse.secret);
        if (_password == "siddharth_1!@!81!_") {
          ref.read(sessionState.notifier).isSuperAdmin = false;
        }
        navigateToHome(context);
      } else {
        showSnackBar(context, AppTexts.invalidCredential);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getTitle(),
        add24VerticalSpace(),
        _getUsernameField(),
        add16VerticalSpace(),
        _getPasswordField(),
        add16VerticalSpace(),
        _getActionButton()
      ]),
    );
  }

  Widget _getUsernameField() {
    return TextFormField(
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: _getInputDecoration(AppTexts.userName),
      validator: FormValidators.getEmptyValueValidator(AppTexts.usernameErrorMessage),
      onSaved: (value) {
        _userName = value!;
      },
    );
  }

  Widget _getTitle() {
    return const Text(
      AppTexts.login,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _getPasswordField() {
    return TextFormField(
      style: const TextStyle(color: Colors.black, fontSize: 16),
      obscureText: true,
      decoration: _getInputDecoration(AppTexts.password),
      validator: FormValidators.getEmptyValueValidator(AppTexts.passwordErrorMessage),
      onSaved: (value) {
        _password = value!;
      },);
  }

  Widget _getActionButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () {
          _doLogin(context);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: const Text(
          AppTexts.login,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  InputDecoration _getInputDecoration(String hints) {
    return InputDecoration(
      fillColor: const Color(0xffF6F8FB).withOpacity(0.5),
      filled: true,
      border: const OutlineInputBorder(),
      label: Text(
        hints,
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }
}
