import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod/atom/base.dart';
import 'package:using_riverpod/atom/button.dart';
import 'package:using_riverpod/atom/input_text.dart';
import 'package:using_riverpod/atom/label.dart';
import 'package:using_riverpod/page/top/top_controller.dart';

class TopPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(topProvider);
    final state = useProvider(topProvider.state);
    final inputTextController = InputTextController(
      isAutoValidation: false,
      onChanged: (val) {
        print(val);
      },
      validator: (val) {
        if (val.isEmpty)
          return '入力しろ！';
        else
          return null;
      },
    );
    return Base(
      body: Column(
        children: [
          Label('counter'),
          Label(state.count.toString()),
          Button(
            'push!',
            onPressed: () {
              provider.increment();
            },
          ),
          InputText(
            controller: inputTextController,
            label: 'label',
            placeholder: 'place',
          ),
          Button('validate!', onPressed: () {
            inputTextController.validation();
          }),
        ],
      ),
    );
  }
}
