import 'package:flutter/material.dart';
import '../widgets/register_bottom_sheet.dart';
import '../widgets/login_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050522),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/Illustration Picture.png'),
              width: 374.57,
              height: 360,
            ),
            //SizedBox(height: 15),
            const Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.w300, // light
                fontStyle: FontStyle.italic,
                fontSize: 25,
                color: Color(0xFFEF5858),
              ),
            ),
            SizedBox(height: 11),
            Container(
              width: 300,
              //padding: const EdgeInsets.only(top: 16, bottom: 60),
              child: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6D6D7D),
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFDE69),
                fixedSize: const Size(281, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: const Color(0xFFFFECAA),
                  isScrollControlled: true,
                  scrollControlDisabledMaxHeightRatio: 1.5,
                  context: context,
                  builder: (context) => RegisterBottomSheet(),
                );
              },
              child: const Text('Create Account',
                  style: TextStyle(color: Color(0xFF050522), fontSize: 20)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(281, 60),
                side: const BorderSide(color: Color(0xFFFFDE69), width: 2),
                backgroundColor: const Color(0xFF050522),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: const Color(0xFFFFECAA),
                  context: context,
                  builder: (context) => LoginBottomSheet(),
                );
              },
              child: const Text('Login',
                  style: TextStyle(color: Color(0xFFFFDE69), fontSize: 20)),
            ),
            SizedBox(height: 39),
            Container(
              width: 300,
              child: const Text(
                'All Right Reserved @2021',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFFDE69),
                  fontSize: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
