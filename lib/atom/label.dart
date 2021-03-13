import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Label extends HookWidget {
  final String text;

  Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(this.text);
  }
}
