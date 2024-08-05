class MyStatelessWidget extends StatelessWidget {
final String data;
const MyStatelessWidget(this.data);
@override
Widget build(BuildContext context) {
return Text(data);
}
}