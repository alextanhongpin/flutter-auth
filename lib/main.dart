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
    return FutureBuilder(
      // Get the provider, and call the getUser method.
        future: context.watch<AuthModel>().authorize(),

        // Wait for the future to resolve and render the appropriate widget for public or private pages.
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return snapshot.hasData ? MaterialApp(
                  home: HomePage(),
                  routes: <String, WidgetBuilder> {
                    '/about': (BuildContext context) => AboutPage()
                  }
              ) : MaterialApp(
                  home: SignInPage(),
                  routes: <String, WidgetBuilder> {
                    '/signin': (BuildContext context) => SignInPage(),
                    '/signup': (BuildContext context) => SignUpPage()
                  }
              )
              ;
            default:
              return CircularProgressIndicator();
          }
        }
    );
  }
}
