import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memeories_app/auth/api/auth_repository.dart';
import 'package:memeories_app/core/utils.dart';
import 'package:memeories_app/onboarding/onboarding.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? _autovalidateMode;
  bool _isSubmitting = false;

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();

  Future<void> _login() async {
    try {
      setState(() {
        _isSubmitting = true;
      });
      await ref.read(authRepositoryProvider).login(
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
          );
      if (mounted) {
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        context.showAlert(e.toString());
      }
    }
  }

  Future<void> _createAccount() async {
    try {
      setState(() {
        _isSubmitting = true;
      });
      await ref.read(onboardingRepositoryProvider).signUp(
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
          username: _usernameCtrl.text);
      if (mounted) {
        context.push('/verification',
            extra: VerificationPageParams(
                email: _emailCtrl.text,
                password: _passwordCtrl.text,
                username: _usernameCtrl.text));
      }
    } catch (e) {
      if (mounted) {
        context.showAlert(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              TextFormField(
                controller: _emailCtrl,
                readOnly: _isSubmitting,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordCtrl,
                readOnly: _isSubmitting,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isSubmitting
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            _login();
                          } else {
                            setState(() {
                              _autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                  child: const Text('Submit'),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 10),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameCtrl,
                readOnly: _isSubmitting,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _isSubmitting
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            _createAccount();
                          } else {
                            setState(() {
                              _autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                  child: const Text('or Create an Account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
