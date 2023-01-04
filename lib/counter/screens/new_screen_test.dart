import 'package:flutter/material.dart';

class NewScreenTest extends StatelessWidget {
  const NewScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Center(child: Text('LETS GO', style: textStyle.bodyMedium)),
    );
  }
}
