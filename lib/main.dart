import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import './firebase_options.dart';

part 'main.g.dart';
part 'main.freezed.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(
        title: 'Flutter Firebase',
      ),
    ),
  ],
);

@freezed
class PhoneAuthData with _$PhoneAuthData {
  const factory PhoneAuthData({
    required String verificationId,
    required String phoneNumber,
  }) = _PhoneAuthData;
}

@riverpod
Stream<User?> authState(AuthStateRef ref) =>
    FirebaseAuth.instance.authStateChanges();

@riverpod
User? authState2(AuthState2Ref ref) {
  User? user;
  FirebaseAuth.instance.authStateChanges().listen((event) {
    user = event;
  });
  return user;
}

@riverpod
class PhoneAuth extends _$PhoneAuth {
  @override
  PhoneAuthData build() =>
      const PhoneAuthData(verificationId: '', phoneNumber: '');

  void onCodeSent(String newVerificationId, int? _) {
    state = state.copyWith(verificationId: newVerificationId);
  }

  void onPhoneNumberChange(String newPhoneNumber) {
    state = state.copyWith(phoneNumber: newPhoneNumber);
  }

  Future<void> onVerificationCompleted(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void onVerificationFailed(FirebaseAuthException exception) {
    log(exception.toString());
  }

  void onCodeAutoRetrievalTimeout(String _) {}

  Future<void> verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: state.phoneNumber,
        verificationCompleted: onVerificationCompleted,
        verificationFailed: onVerificationFailed,
        codeSent: onCodeSent,
        codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout);
  }

  Future<void> signInWithSmsCode(String smsCode) async {
    final credential = PhoneAuthProvider.credential(
        verificationId: state.verificationId, smsCode: smsCode);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    state = const PhoneAuthData(verificationId: '', phoneNumber: '');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

// Ideal time to initialize
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Firebase',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final phoneAuth = ref.watch(phoneAuthProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: switch (authState) {
          AsyncData(:final value) => value == null
              ? (phoneAuth.verificationId == ''
                  ? const PhoneNumberVerificationPage()
                  : const SmsCodeVerificationPage())
              : const UserHomePage(),
          AsyncError(:final error) => Text(error.toString()),
          _ => const CircularProgressIndicator(),
        });
    // body: authState == null
    //     ? (phoneAuth.verificationId == ''
    //         ? const PhoneNumberVerificationPage()
    //         : const SmsCodeVerificationPage())
    //     : const UserHomePage());
  }
}

class UserHomePage extends ConsumerWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneAuthViewModel = ref.watch(phoneAuthProvider.notifier);
    assert(FirebaseAuth.instance.currentUser != null);
    return Column(
      children: [
        Text(FirebaseAuth.instance.currentUser.toString()),
        FilledButton(
            onPressed: () {
              phoneAuthViewModel.signOut();
              context.go('/');
            },
            child: const Text('Signout'))
      ],
    );
  }
}

class PhoneNumberVerificationPage extends ConsumerWidget {
  const PhoneNumberVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneAuthViewModel = ref.watch(phoneAuthProvider.notifier);
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            phoneAuthViewModel.onPhoneNumberChange(value);
            context.go('/');
          },
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'Phone number'),
        ),
        FilledButton(
            onPressed: () {
              phoneAuthViewModel.verifyPhoneNumber();
            },
            child: const Text('OK'))
      ],
    );
  }
}

class SmsCodeVerificationPage extends ConsumerWidget {
  const SmsCodeVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneAuthViewModel = ref.watch(phoneAuthProvider.notifier);

    return TextField(
      onChanged: (value) {
        if (value.length == 6) {
          phoneAuthViewModel.signInWithSmsCode(value);
          context.go('/');
        }
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'Sms Code'),
    );
  }
}
