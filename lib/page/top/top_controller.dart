import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:using_riverpod/atom/input_text.dart';
import 'package:using_riverpod/page/top/state/top_state.dart';

final topProvider = StateNotifierProvider((_) => TopController());

class TopController extends StateNotifier<TopState> {
  InputTextController inputTextController;

  TopController._internal() : super(TopState());

  factory TopController() {
    TopController _top = TopController._internal();
    _top.inputTextController = InputTextController(
      onChanged: (val) => _top.onTextChange(val),
      validator: (val) => _top.textValidation(val),
    );
    _top.inputTextController.setField('init text');
    return _top;
  }

  void onTextChange(String text) {
    print('changed: $text');
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
