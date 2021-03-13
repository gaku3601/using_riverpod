import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:using_riverpod/atom/base.dart';
import 'package:using_riverpod/atom/button.dart';
import 'package:using_riverpod/atom/label.dart';

class MyPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Base(
      body: Column(
        children: [
          Label('counter'),
          Label('0'),
          Button(
            'push!',
            onPressed: () {
              print(0);
            },
          ),
        ],
      ),
    );
  }
}
