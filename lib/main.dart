import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// Pages.
import 'pages/signin.dart';
import 'pages/signup.dart';
import 'pages/home.dart';
import 'pages/about.dart';

// Domains.
import 'domains/user.dart';

// Services.
import 'models/auth.dart';

void main() => runApp(
    ChangeNotifierProvider<AuthModel>(
      child: App(),
      create: (BuildContext context) => AuthModel()
    )
);

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: FutureBuilder(
          // Get the provider, and call the getUser method.
            future: Provider.of<AuthModel>(context).authorize(),

            // Wait for the future to resolve and render the appropriate widget for HomePage or LoginPage.
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return snapshot.hasData ? HomePage() : SignInPage();
                default:
                  return CircularProgressIndicator();
              }
            }
        ),
        routes: <String, WidgetBuilder> {
          '/about': (BuildContext context) => AboutPage(),
          '/signin': (BuildContext context) => SignInPage(),
          '/signup': (BuildContext context) => SignUpPage()
        }
    );
  }
}
