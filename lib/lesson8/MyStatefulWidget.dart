class MyStatefulWidget extends StatefulWidget {
@override
State<StatefulWidget> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
String data = "Tap to change";
@override
Widget build(BuildContext context) =>
GestureDetector(
onTap: () => setState(() {data = "I am Stateful!";}),
child: Text(data),
);
}