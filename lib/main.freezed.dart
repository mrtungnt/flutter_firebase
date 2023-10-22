// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhoneAuthData {
  String get verificationId => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneAuthDataCopyWith<PhoneAuthData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneAuthDataCopyWith<$Res> {
  factory $PhoneAuthDataCopyWith(
          PhoneAuthData value, $Res Function(PhoneAuthData) then) =
      _$PhoneAuthDataCopyWithImpl<$Res, PhoneAuthData>;
  @useResult
  $Res call({String verificationId, String phoneNumber});
}

/// @nodoc
class _$PhoneAuthDataCopyWithImpl<$Res, $Val extends PhoneAuthData>
    implements $PhoneAuthDataCopyWith<$Res> {
  _$PhoneAuthDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneAuthDataImplCopyWith<$Res>
    implements $PhoneAuthDataCopyWith<$Res> {
  factory _$$PhoneAuthDataImplCopyWith(
          _$PhoneAuthDataImpl value, $Res Function(_$PhoneAuthDataImpl) then) =
      __$$PhoneAuthDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String verificationId, String phoneNumber});
}

/// @nodoc
class __$$PhoneAuthDataImplCopyWithImpl<$Res>
    extends _$PhoneAuthDataCopyWithImpl<$Res, _$PhoneAuthDataImpl>
    implements _$$PhoneAuthDataImplCopyWith<$Res> {
  __$$PhoneAuthDataImplCopyWithImpl(
      _$PhoneAuthDataImpl _value, $Res Function(_$PhoneAuthDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneAuthDataImpl(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneAuthDataImpl implements _PhoneAuthData {
  const _$PhoneAuthDataImpl(
      {required this.verificationId, required this.phoneNumber});

  @override
  final String verificationId;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'PhoneAuthData(verificationId: $verificationId, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneAuthDataImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneAuthDataImplCopyWith<_$PhoneAuthDataImpl> get copyWith =>
      __$$PhoneAuthDataImplCopyWithImpl<_$PhoneAuthDataImpl>(this, _$identity);
}

abstract class _PhoneAuthData implements PhoneAuthData {
  const factory _PhoneAuthData(
      {required final String verificationId,
      required final String phoneNumber}) = _$PhoneAuthDataImpl;

  @override
  String get verificationId;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$PhoneAuthDataImplCopyWith<_$PhoneAuthDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
