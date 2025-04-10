import 'package:flutter/material.dart';
import 'package:flutter_modular_example/scaffold_with_navbar.dart';
import 'package:flutter_module1/screen_1.dart';
import 'package:flutter_module2/screen_2.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MainApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final GoRouter goRouter = GoRouter(
      initialLocation: "/screen1",
      navigatorKey: _rootNavigatorKey,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            // Return the widget with a BottomNavigationBar
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/screen1',
                  builder: (context, state) => const Screen1(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/screen2',
                  builder: (context, state) => const Screen2(),
                ),
              ],
            ),
          ],
        ),
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Modular Example',
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}
