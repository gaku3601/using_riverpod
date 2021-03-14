import 'dart:async';

import 'package:flutter/material.dart';

class InputTextController {
  // prop
  final bool isAutoValidation;
  final String Function(String text) validator;
  final Function(String text) onChanged;

  // controller
  final _setTextController = StreamController<TextEditingController>();
  final _errorController = StreamController<String>();

  // 出力
  Stream<String> get onError => this._errorController.stream;

  Stream<TextEditingController> get onSetText => this._setTextController.stream;

  // state
  String _text = '';

  InputTextController({
    this.isAutoValidation = true,
    String Function(String text) validator,
    Function(String text) onChanged,
  })  : this.validator = validator ?? ((String value) => null),
        this.onChanged = onChanged ?? ((String value) {});

  // バリデーション処理
  bool onValidation() {
    this._errorController.sink.add(this.validator(this._text));
    return this.validator(this._text) != null;
  }

  // textFieldに文字をセットします
  void setText(String text) {
    this.changeText(text);
    final textEditingController = TextEditingController(text: text);
    textEditingController.selection =
        TextSelection.collapsed(offset: text.length);
    _setTextController.sink.add(textEditingController);
  }

  // text変更処理
  void changeText(String text) {
    this._text = text;
    this.onChanged(this._text);
    if (this.isAutoValidation) {
      this.onValidation();
    }
  }

  void dispose() {
    this._setTextController.close();
    this._errorController.close();
  }
}

class InputText extends StatefulWidget {
  final String label;
  final String placeholder;
  final InputTextController controller;

  InputText({this.label, this.placeholder, InputTextController controller})
      : this.controller = controller ?? InputTextController();

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<String>(
        stream: this.widget.controller.onError,
        builder: (context, error) {
          return StreamBuilder<TextEditingController>(
            stream: this.widget.controller.onSetText,
            builder: (context, text) {
              return TextField(
                controller: text.data,
                onChanged: (String value) {
                  this.widget.controller.changeText(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: this.widget.label,
                  hintText: this.widget.placeholder,
                  errorText: error.data,
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    this.widget.controller.dispose();
  }
}
