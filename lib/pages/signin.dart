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
              ),
              SizedBox(height: 20.0),
              TextFormField(
                onSaved: (value) => _password = value,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  child: Text('Login'),
                  onPressed: () async {
                    final form = _formKey.currentState;
                    form.save();

                    if (form.validate()) {
                      try {
                        await Provider.of<AuthModel>(context, listen: false)
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
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text('Register a new account.')),
            ]
          )
        )
      )
    );
  }
}
