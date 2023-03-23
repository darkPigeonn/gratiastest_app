import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../connections/database.dart';

class FormQuestion extends StatefulWidget {
  const FormQuestion({super.key});

  @override
  State<FormQuestion> createState() => _FormQuestionState();
}

class _FormQuestionState extends State<FormQuestion> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Title',
                  style: TextStyle(
                      color: Color(0xFF2c384a),
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _titleController,
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                  ),
                )
              : Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_addItemFormKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
                            title: "title", description: "description");
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orangeAccent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'Tambah Data',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
