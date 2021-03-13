import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Base extends HookWidget {
  final Widget body;

  Base({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: this.body),
    );
  }
}
