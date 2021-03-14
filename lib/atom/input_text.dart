import 'dart:async';

import 'package:flutter/material.dart';

class InputTextController {
  // prop
  final bool isAutoValidation;
  final String Function(String text) validator;
  final Function(String text) onChanged;

  // controller
  final _textController = StreamController<String>();
  final _errorController = StreamController<String>();

  // state
  String text;

  // 入力
  Function get setText => _textController.sink.add;

  // 出力
  Stream<String> get onError => this._errorController.stream;

  InputTextController({
    this.text = '',
    this.isAutoValidation = true,
    String Function(String text) validator,
    Function(String text) onChanged,
  })  : this.validator = validator ?? ((String value) => null),
        this.onChanged = onChanged ?? ((String value) {}) {
    _textController.stream.listen((String val) => this._onChangeText(val));
  }

  // バリデーション処理
  bool onValidation() {
    this._errorController.sink.add(this.validator(this.text));
    return this.validator(this.text) != null;
  }

  // text変更処理
  void _onChangeText(String text) {
    this.text = text;
    this.onChanged(this.text);
    if (this.isAutoValidation) {
      this.onValidation();
    }
  }

  void dispose() {
    this._textController.close();
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
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    this._controller = TextEditingController(text: this.widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<String>(
        stream: this.widget.controller.onError,
        builder: (context, snapshot) {
          return TextField(
            controller: this._controller,
            onChanged: (String value) {
              this.widget.controller.setText(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: this.widget.label,
              hintText: this.widget.placeholder,
              errorText: snapshot.data,
            ),
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
