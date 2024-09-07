import 'package:day14_mytask/controllers/user_controller.dart';
import 'package:day14_mytask/widgets/register_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final userController = UserController();
  bool? _rememberMe = false;
  bool _obscurePassword = true;

  void _Login() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        username: _usernameController.text,
        password: _passwordController.text,
      );
      userController.createUser(user.username, user.password);
      print('Login Successful');
      Navigator.pop(context);
    } else {
      print('Login Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome Back!!!',
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF050522),
                    fontWeight: FontWeight.normal),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
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
            const SizedBox(height: 20),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'info@example.com',
                labelText: 'Username/email',
                suffixIcon: Icon(Icons.lock_outline_rounded),
                labelStyle: TextStyle(color: Color(0xFF050522)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF050522)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: _obscurePassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                labelStyle: TextStyle(color: Color(0xFF050522)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF050522)),
                ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 190,
                  child: CheckboxListTile(
                    title: const Text('Remember Me'),
                    contentPadding: const EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true, //1
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, //2
                    visualDensity: VisualDensity.compact, //3
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(
                        () {
                          _rememberMe = value;
                        },
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?',
                      style: TextStyle(color: Color(0xFF050522), fontSize: 8)),
                ),
              ],
            ),
            const SizedBox(height: 7),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(335, 50),
                backgroundColor: const Color(0xFF050522),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                _Login();
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFFFFDE69),
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?',
                    style: TextStyle(color: Color(0xFF050522), fontSize: 8)),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      backgroundColor: const Color(0xFFFFECAA),
                      context: context,
                      builder: (context) => RegisterBottomSheet(),
                    );
                  },
                  child: const Text('  Register',
                      style: TextStyle(color: Color(0xFFEF5858), fontSize: 8)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
