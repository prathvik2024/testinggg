import 'package:flutter/material.dart';

void main() {
  const String apiUrl = String.fromEnvironment('API_URL', defaultValue: 'fail');
  const String appEnv = String.fromEnvironment('APP_ENV', defaultValue: 'failed');
  runApp(const MyApp(
    apiUrl: apiUrl,
    appEnv: appEnv,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.apiUrl, required this.appEnv});

  final String apiUrl;
  final String appEnv;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        appEnv: appEnv,
        apiUrl: apiUrl,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.apiUrl, required this.appEnv});

  final String title;
  final String apiUrl;
  final String appEnv;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("API KEY: ${widget.apiUrl}")));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ENV: ${widget.appEnv}")));
  }

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
