import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// Pages.
import 'pages/signin.dart';
import 'pages/signup.dart';
import 'pages/home.dart';
import 'pages/food.dart';
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
  final protectedRoutes = <String, WidgetBuilder> {
    '/about': (context) => AboutPage(),
    '/food': (context) => FoodPage(),
  };

  final publicRoutes = <String, WidgetBuilder> {
    '/signin': (context) => SignInPage(),
    '/signup': (context) => SignUpPage(),
    // Dumb page to allow redirection when the user is authorized.
    '/food': (context) => CircularProgressIndicator(),
  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Get the provider, and call the getUser method.
        future: context.watch<AuthModel>().fetchUser(),

        // Wait for the future to resolve and render the appropriate widget for public or private pages.
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  // The history route is not persisted. Restore from shared preferences?
                  // initialRoute: '/',
                  home: snapshot.hasData ? HomePage() : SignInPage(),
                  routes: snapshot.hasData ? protectedRoutes : publicRoutes,
                );
            default:
              return CircularProgressIndicator();
          }
        }
    );
  }
}
