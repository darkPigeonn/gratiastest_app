import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String sectionName;

  const AppBarTitle({Key? key, required this.sectionName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$sectionName', style: TextStyle(color : Colors.orangeAccent, fontSize: 18,),),
      ],
    );
  }
}
