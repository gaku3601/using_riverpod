import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod/atom/base.dart';
import 'package:using_riverpod/atom/button.dart';
import 'package:using_riverpod/atom/input_text.dart';
import 'package:using_riverpod/atom/label.dart';
import 'package:using_riverpod/page/second/second_page.dart';
import 'package:using_riverpod/page/top/top_controller.dart';

class TopPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(topProvider);
    final state = useProvider(topProvider.state);
    return Base(
      controller: provider.baseController,
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
            controller: provider.inputTextController,
            label: 'label',
            placeholder: 'place',
          ),
          Button('登録', onPressed: () => provider.register()),
          Button('リセット', onPressed: () => provider.reset()),
          Button('ローディング', onPressed: () => provider.startLoading()),
          Button('スナックバー', onPressed: () => provider.displaySnackbar()),
          Button(
            '遷移',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return SecondPage();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
