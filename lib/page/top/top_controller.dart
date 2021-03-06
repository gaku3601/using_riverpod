import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:using_riverpod/atom/base.dart';
import 'package:using_riverpod/atom/input_text.dart';
import 'package:using_riverpod/page/top/state/top_state.dart';

final topProvider = StateNotifierProvider.autoDispose((_) => TopController());

class TopController extends StateNotifier<TopState> {
  InputTextController inputTextController;
  BaseController baseController;

  TopController._() : super(TopState());

  factory TopController() {
    // もしくはinit methodを作ってそこでcontrollerに値をセットする
    TopController _top = TopController._();
    _top.inputTextController = InputTextController(
      onChanged: (val) => _top.onTextChange(val),
      validator: (val) => _top.textValidation(val),
    );
    _top.inputTextController.setField('init text');
    _top.baseController = BaseController();
    return _top;
  }

  void startLoading() async {
    this.baseController.onStartLoading();
    await new Future.delayed(new Duration(seconds: 3));
    this.baseController.onEndLoading();
  }

  void onTextChange(String text) {
    print('changed: $text');
  }

  void displaySnackbar() {
    this.baseController.onSnackbar(SnackBar(
        content: Text('test'),
        action: SnackBarAction(
          label: 'test',
          onPressed: this.snackbarAction,
        )));
  }

  void snackbarAction() {
    print('action!');
  }

  String textValidation(String text) {
    if (text.isEmpty)
      return '入力しろ！';
    else
      return null;
  }

  void register() {
    if (this.inputTextController.onValidation()) {
      print('errroがあるよ！');
      return;
    }
    print(this.inputTextController.text);
    print('登録完了！');
  }

  void reset() {
    this.inputTextController.setField('resetText');
  }

  void increment() => state = state.copyWith(count: state.count + 1);
}
