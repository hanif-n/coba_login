import 'package:coba_login/widget/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _cUserID = new TextEditingController();
    final TextEditingController _cPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyLoginPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginTextField(
              controller: _cUserID, 
              labelText: 'User ID',
              prefixIcon: Icons.person,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
              child: LoginTextField(
                controller: _cPassword, 
                labelText: 'Password',
                prefixIcon: Icons.lock,
                obscuretext: true,
                border: UnderlineInputBorder(),
              ),
            ),
            ElevatedButton.icon(
              onPressed: (){},
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
            ),
          ],
        ),
      ),
    );
  }
}