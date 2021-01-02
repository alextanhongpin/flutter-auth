import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auth/models/auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In')
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                  'Login information',
                  style: TextStyle(fontSize: 20.0)
              ),
              SizedBox(height: 20.0),

              _error.isEmpty ? Text('') : Text(_error),
              SizedBox(height: 20.0),

              TextFormField(
                onSaved: (value) => _email = value,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email Address'),
                validator: (email) {
                  if (email.isEmpty) {
                    return 'Email is required';
                  }
                  if (!email.contains('@')) {
                    return 'Email is invalid';
                  }
                  return null;
                }
              ),
              SizedBox(height: 20.0),

              TextFormField(
                onSaved: (value) => _password = value,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (password) {
                  if (password.isEmpty) {
                    return 'Password is required';
                  }
                  if (password.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                }
              ),
              SizedBox(height: 20.0),

              RaisedButton(
                  child: Text('Login'),
                  onPressed: () async {
                    final form = _formKey.currentState;
                    form.save();

                    if (form.validate()) {
                      try {
                        await context.read<AuthModel>()
                            .login(
                            email: _email,
                            password: _password
                        );
                      } catch (error) {
                        setState(() {
                          _error = error.toString();
                        });
                      }
                    }
                  }
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Text('Register a new account.')),
            ]
          )
        )
      )
    );
  }
}
