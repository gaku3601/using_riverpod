import 'dart:async';

import 'package:flutter/material.dart';
import 'package:using_riverpod/util/stream_util.dart';

class ErrorEvent extends StreamEvent {
  ErrorEvent(String error) : super(error);
}

class SetTextFieldEvent extends StreamEvent {
  SetTextFieldEvent._(TextEditingController textEditingController)
      : super(textEditingController);

  factory SetTextFieldEvent(String text) {
    TextEditingController controller = TextEditingController(text: text);
    controller.selection = TextSelection.collapsed(offset: text.length);

    return SetTextFieldEvent._(controller);
  }
}

class InputTextController {
  // prop
  final bool isAutoValidation;
  final String Function(String text) validator;
  final Function(String text) onChanged;

  // controller
  final _controller = StreamController<StreamEvent>();

  // 出力
  Stream<StreamEvent> get output => this._controller.stream;

  // state
  String _text = '';

  String get text => this._text;

  InputTextController({
    this.isAutoValidation = true,
    String Function(String text) validator,
    Function(String text) onChanged,
  })  : this.validator = validator ?? ((String value) => null),
        this.onChanged = onChanged ?? ((String value) {});

  // バリデーション処理
  bool onValidation() {
    this._controller.sink.add(ErrorEvent(this.validator(this._text)));
    return this.validator(this._text) != null;
  }

  // textFieldに文字をセットします
  void setField(String text) {
    this.changeText(text);
    _controller.sink.add(SetTextFieldEvent(text));
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
    this._controller.close();
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
      child: StreamBuilder<StreamEvent>(
        stream: this.widget.controller.output,
        builder: (context, snapshot) {
          return TextField(
            controller: snapshot.data?.returnValue<SetTextFieldEvent>(),
            onChanged: (String value) {
              this.widget.controller.changeText(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: this.widget.label,
              hintText: this.widget.placeholder,
              errorText: snapshot.data?.returnValue<ErrorEvent>(),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    this.widget.controller.dispose();
    super.dispose();
  }
}
