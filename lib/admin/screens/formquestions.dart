import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../connections/database.dart';

class FormQuestion extends StatefulWidget {
  const FormQuestion({super.key});

  @override
  State<FormQuestion> createState() => _FormQuestionState();
}

class _FormQuestionState extends State<FormQuestion> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  // final TextEditingController _titleController = TextEditingController();
  // final TextEditingController _answerController1 = TextEditingController();
  // final TextEditingController _answerController2 = TextEditingController();
  // final TextEditingController _answerController3 = TextEditingController();
  // final TextEditingController _answerController4 = TextEditingController();
  // final TextEditingController _answerController5 = TextEditingController();

  final HtmlEditorController controller = HtmlEditorController();
  final HtmlEditorController _answerController1 = HtmlEditorController();
  final HtmlEditorController _answerController2 = HtmlEditorController();
  final HtmlEditorController _answerController3 = HtmlEditorController();
  final HtmlEditorController _answerController4 = HtmlEditorController();
  final HtmlEditorController _answerController5 = HtmlEditorController();

  saveQuestions() async {
    Map dataSave = {};

    await controller.getText().then((value) {
      setState(() {
        dataSave['quetion'] = value;
      });
    });
    await _answerController1.getText().then((value) {
      setState(() {
        dataSave['answer_a'] = value;
      });
    });
    await _answerController2.getText().then((value) {
      setState(() {
        dataSave['answer_b'] = value;
      });
    });
    await _answerController3.getText().then((value) {
      setState(() {
        dataSave['answer_c'] = value;
      });
    });
    await _answerController4.getText().then((value) {
      setState(() {
        dataSave['answer_d'] = value;
      });
    });
    await _answerController5.getText().then((value) {
      setState(() {
        dataSave['answer_e'] = value;
      });
    });

    print(jsonEncode(dataSave));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addItemFormKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  form_text(controller: controller, label: 'Pertanyaan'),
                  form_text(controller: _answerController1, label: 'Jawaban A'),
                  form_text(controller: _answerController2, label: 'Jawaban B'),
                  form_text(controller: _answerController3, label: 'Jawaban C'),
                  form_text(controller: _answerController4, label: 'Jawaban D'),
                  form_text(controller: _answerController5, label: 'Jawaban E'),
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
                          saveQuestions();

                          // await Database.addItem(
                          //     title: "title", description: "description");
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orangeAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
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
      ),
    );
  }
}

class form_text extends StatelessWidget {
  const form_text({
    super.key,
    required this.controller,
    required this.label,
  });

  final HtmlEditorController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    final HtmlEditorController _titleController2 = new HtmlEditorController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label',
            style: TextStyle(
                color: Color(0xFF2c384a),
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.bold),
          ),
          HtmlEditor(
            controller: controller,
            htmlEditorOptions: const HtmlEditorOptions(
                hint: 'Content',
                shouldEnsureVisible: true,
                autoAdjustHeight: true),
            htmlToolbarOptions: const HtmlToolbarOptions(
              toolbarPosition: ToolbarPosition.belowEditor, //by default
              defaultToolbarButtons: [
                ColorButtons(),
                ListButtons(listStyles: false),
                InsertButtons(
                    audio: false,
                    video: false,
                    otherFile: false,
                    table: false,
                    hr: false),
              ], //by default
            ),
            otherOptions: OtherOptions(
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 0))),
          ),
        ],
      ),
    );
  }
}
