import 'package:flutter/cupertino.dart';

class MyStatelessWidget extends StatelessWidget {
  final String data;

  const MyStatelessWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
