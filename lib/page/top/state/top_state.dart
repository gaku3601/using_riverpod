import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_state.freezed.dart';

@freezed
abstract class TopState with _$TopState {
  const factory TopState({
    @Default(0) int count,
  }) = _TopState;
}
