import 'package:flutter/cupertino.dart';

class MyInheritedWidget extends InheritedWidget {
  final String data = "This data belongs to MyInheritedWidget!";

  const MyInheritedWidget({super.key, required super.child});

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) => false;
}

class WidgetUsingInheritedWidget extends StatelessWidget {
  const WidgetUsingInheritedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final inherited = MyInheritedWidget.of(context);
    return Text(inherited!.data);
  }
}
