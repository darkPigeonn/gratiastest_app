import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:gratiastest_app/admin/screens/formquestions.dart';
import 'package:gratiastest_app/components/app_bar.dart';

class QuestionAdd extends StatelessWidget {
  const QuestionAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF2C384A),
          title: AppBarTitle(sectionName: 'CRUD'),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: FormQuestion()),
        ),
      ),
    );
  }
}
