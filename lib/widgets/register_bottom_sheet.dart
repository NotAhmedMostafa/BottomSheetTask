import 'package:flutter/material.dart';

import 'login_bottom_sheet.dart';

class RegisterBottomSheet extends StatefulWidget {
  RegisterBottomSheet({super.key});

  @override
  State<RegisterBottomSheet> createState() => _CreateAccountBottomSheetState();
}

class _CreateAccountBottomSheetState extends State<RegisterBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _courseController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hello...',
                  style: TextStyle(fontSize: 15, color: Color(0xFF050522)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.visibility),
                  labelStyle: TextStyle(color: Color(0xFF050522)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF050522)),
                  ),
                  hintText: 'info@example.com',
                  labelText: 'Username/email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter username.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _courseController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.visibility),
                  labelStyle: TextStyle(color: Color(0xFF050522)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF050522)),
                  ),
                  hintText: 'Course',
                  labelText: 'Course',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter coursename.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  labelStyle: TextStyle(color: Color(0xFF050522)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF050522)),
                  ),
                  hintText: 'password',
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  labelStyle: TextStyle(color: Color(0xFF050522)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF050522)),
                  ),
                  hintText: 'confirmPassword',
                  labelText: 'confirmPassword',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(281, 60),
                  backgroundColor: const Color(0xFF050522),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Color(0xFFFFDE69),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have account? ',
                    style: TextStyle(color: Color(0xFF050522), fontSize: 12),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        backgroundColor: const Color(0xFFFFECAA),
                        context: context,
                        builder: (context) => const LoginBottomSheet(),
                      );
                    },
                    child: const Text('Login',
                        style:
                            TextStyle(color: Color(0xFFEF5858), fontSize: 12)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
