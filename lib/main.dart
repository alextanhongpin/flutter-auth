import 'package:flutter/material.dart';
import 'pages/signin.dart';
import 'pages/signup.dart';
import 'pages/home.dart';
import 'services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider<AuthService>(
      child: MyApp(),
      create: (BuildContext context) => AuthService()
    )
);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: FutureBuilder(
        // Get the provider, and call the getUser method.
        future: Provider.of<AuthService>(context).getUser(),

        // Wait for the future to resolve and render the appropriate widget for HomePage or LoginPage.
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.hasData ? HomePage() : SignInPage();
          } else {
            return Container(color: Colors.white);
          }
        }
      ),
      routes: <String, WidgetBuilder> {
        '/signin': (BuildContext context) => SignInPage(),
        '/signup': (BuildContext context) => SignUpPage()
      }
    );
  }
}
