import 'package:dark_night_mode_app/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppTheme(),
      child: Consumer<AppTheme>(builder: (context, mode, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: mode.themeMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, inversePrimary: Colors.red),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                onBackground: Colors.indigoAccent,
                surfaceTint: Colors.amber,
                seedColor: Colors.deepPurple,
                inversePrimary: Colors.amber,
                brightness: Brightness.dark,
              ),
              useMaterial3: true),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<AppTheme>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            CupertinoSwitch(
              activeColor: Colors.black,
              value: themeMode.themeMode == ThemeMode.light ? false : true,
              onChanged: (bool value) {
                themeMode.changeTheme();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
