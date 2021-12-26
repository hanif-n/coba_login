import 'package:coba_login/view_model/login_view_model.dart';
import 'package:coba_login/widget/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _cUserID = new TextEditingController();
  final TextEditingController _cPassword = new TextEditingController();

  // Perlu untuk validasi form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = LoginViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginTextField(
              controller: _cUserID,
              labelText: 'User ID',
              prefixIcon: Icons.person,
              validator:
                  RequiredValidator(errorText: "User ID harus diisi"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
              child: LoginTextField(
                controller: _cPassword,
                labelText: 'Password',
                prefixIcon: Icons.lock,
                obscuretext: true,
                border: UnderlineInputBorder(),
                validator: RequiredValidator(
                    errorText: "Password harus diisi"),
              ),
            ),
            ElevatedButton.icon(
              icon: Icon(
                Icons.login,
              ),
              label: Text("Login"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(12.0, 15.0, 15.0, 15.0),
                textStyle: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if(!(await loginViewModel.tryLogin(_cUserID.text, _cPassword.text))){
                    final snackBar = SnackBar(
                      content: Text(loginViewModel.message!),
                      action: SnackBarAction(
                        label: 'Tutup',
                        onPressed: () {
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else{
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
