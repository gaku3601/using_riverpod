// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'top_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TopStateTearOff {
  const _$TopStateTearOff();

// ignore: unused_element
  _TopState call({int count = 0}) {
    return _TopState(
      count: count,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TopState = _$TopStateTearOff();

/// @nodoc
mixin _$TopState {
  int get count;

  @JsonKey(ignore: true)
  $TopStateCopyWith<TopState> get copyWith;
}

/// @nodoc
abstract class $TopStateCopyWith<$Res> {
  factory $TopStateCopyWith(TopState value, $Res Function(TopState) then) =
      _$TopStateCopyWithImpl<$Res>;
  $Res call({int count});
}

/// @nodoc
class _$TopStateCopyWithImpl<$Res> implements $TopStateCopyWith<$Res> {
  _$TopStateCopyWithImpl(this._value, this._then);

  final TopState _value;
  // ignore: unused_field
  final $Res Function(TopState) _then;

  @override
  $Res call({
    Object count = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed ? _value.count : count as int,
    ));
  }
}

/// @nodoc
abstract class _$TopStateCopyWith<$Res> implements $TopStateCopyWith<$Res> {
  factory _$TopStateCopyWith(_TopState value, $Res Function(_TopState) then) =
      __$TopStateCopyWithImpl<$Res>;
  @override
  $Res call({int count});
}

/// @nodoc
class __$TopStateCopyWithImpl<$Res> extends _$TopStateCopyWithImpl<$Res>
    implements _$TopStateCopyWith<$Res> {
  __$TopStateCopyWithImpl(_TopState _value, $Res Function(_TopState) _then)
      : super(_value, (v) => _then(v as _TopState));

  @override
  _TopState get _value => super._value as _TopState;

  @override
  $Res call({
    Object count = freezed,
  }) {
    return _then(_TopState(
      count: count == freezed ? _value.count : count as int,
    ));
  }
}

/// @nodoc
class _$_TopState implements _TopState {
  const _$_TopState({this.count = 0}) : assert(count != null);

  @JsonKey(defaultValue: 0)
  @override
  final int count;

  @override
  String toString() {
    return 'TopState(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TopState &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$TopStateCopyWith<_TopState> get copyWith =>
      __$TopStateCopyWithImpl<_TopState>(this, _$identity);
}

abstract class _TopState implements TopState {
  const factory _TopState({int count}) = _$_TopState;

  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$TopStateCopyWith<_TopState> get copyWith;
}
