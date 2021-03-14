import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Base extends StatelessWidget {
  final Widget body;

  Base({this.body});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // カーソルをはずす処理
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: this.body,
          ),
        ),
      ),
    );
  }
}
