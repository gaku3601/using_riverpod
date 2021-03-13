import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Base extends StatelessWidget {
  final Widget body;

  Base({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: this.body),
    );
  }
}
