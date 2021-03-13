import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:using_riverpod/page/top/state/top_state.dart';

final topProvider = StateNotifierProvider((_) => TopController());

class TopController extends StateNotifier<TopState> {
  TopController() : super(TopState());

  increment() => state = state.copyWith(count: state.count + 1);
}
