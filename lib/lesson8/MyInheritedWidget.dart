class MyInheritedWidget extends InheritedWidget {
final String data = "This data belongs to MyInheritedWidget!";
MyInheritedWidget({required Widget child}) : super(child: child);
static MyInheritedWidget? of(BuildContext context) {
return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
}
@override
bool updateShouldNotify(MyInheritedWidget oldWidget) => false;
}
class WidgetUsingInheritedWidget extends StatelessWidget {
@override
Widget build(BuildContext context) {
final inherited = MyInheritedWidget.of(context);
return Text(inherited!.data);
}
}