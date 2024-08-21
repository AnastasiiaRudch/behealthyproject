import 'package:behealthyproject/theme.dart';
import 'package:flutter/material.dart';

import 'calendarstate_provider.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be Healthy App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light, //system - tema yak v telephoni
      home: const CalendarStateProvider(
        child: HomeScreen(),
      ),
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

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print('Size is ${SizeContainer.of(context)!.biggestSize}');
    });
    super.initState();
  }

  void _incrementCounter() {
    SizeContainer.of(context)!.updateSize(true);
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); //dostup do colory temu
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
              style: theme.textTheme.headlineLarge!.copyWith(
                fontSize: SizeContainer.of(context)!.biggestSize,
                color: theme.colorScheme.primary,
              ),
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

class SizeContainer extends InheritedWidget {
  double biggestSize = 100;

  SizeContainer({super.key, required super.child});

  static SizeContainer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SizeContainer>();
  }

  void updateSize(bool isIncrease){
    if(isIncrease){
      biggestSize++;
    }else{
      biggestSize--;
    }

  }

  @override
  bool updateShouldNotify(SizeContainer oldWidget) =>
      oldWidget.biggestSize != biggestSize;
}
