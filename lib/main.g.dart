// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateHash() => r'baf32c03854278f1e773e0d3f2cb50d9b6270837';

/// See also [authState].
@ProviderFor(authState)
final authStateProvider = AutoDisposeStreamProvider<User?>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateRef = AutoDisposeStreamProviderRef<User?>;
String _$authState2Hash() => r'dc7d1b8965a76655c2cecbd85ed85dbbcfeb52c3';

/// See also [authState2].
@ProviderFor(authState2)
final authState2Provider = AutoDisposeProvider<User?>.internal(
  authState2,
  name: r'authState2Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authState2Hash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthState2Ref = AutoDisposeProviderRef<User?>;
String _$phoneAuthHash() => r'90238b0a0288fb64134f6c8d35958f23a2a1cef8';

/// See also [PhoneAuth].
@ProviderFor(PhoneAuth)
final phoneAuthProvider =
    AutoDisposeNotifierProvider<PhoneAuth, PhoneAuthData>.internal(
  PhoneAuth.new,
  name: r'phoneAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$phoneAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PhoneAuth = AutoDisposeNotifier<PhoneAuthData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
