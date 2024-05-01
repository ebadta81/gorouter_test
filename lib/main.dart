import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



late GoRouter router;

void main() {
  router = createRouter();
  runApp(const MainApp());
}



GoRouter createRouter() {
  return GoRouter(
      initialLocation: "/",
      //debugLogDiagnostics: true,
      routes: [
        GoRoute(path: '/', builder: (context, state) => Widget1(), routes: [
          GoRoute(
              path: '2',
              builder: (context, state) => Widget2(),
              routes: [
                GoRoute(
                  path: '3/:id',
                  builder: (context, state) => Widget3(
                      id:
                          int.parse(state.pathParameters['id'] ?? "0")),
                ),
              ]),
        ])
      ]);
}

class Widget1 extends StatelessWidget {
  Widget1({super.key}) {
    debugPrint("Widget1");
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FilledButton(onPressed: () => context.go("/2"),
          child: const Text("Go to 2"),),
        ),
      );
  }
}

class Widget2 extends StatelessWidget {
  Widget2({super.key}) {
    debugPrint("Widget2");
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FilledButton(onPressed: () => context.go("/2/3/1111"),
          child: const Text("Go to 3"),),
        ),
      );
  }
}

class Widget3 extends StatelessWidget {
  final int id;

  Widget3({super.key, required this.id}) {
    debugPrint("Widget3");
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FilledButton(onPressed: () => context.go("/"),
          child: const Text("Go to 1"),),
        ),
      );
  }
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
