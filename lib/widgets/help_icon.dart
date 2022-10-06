import 'package:flutter/material.dart';
import 'package:helpapp/screens/email_screen.dart';

class HelpIcon extends StatelessWidget {
  const HelpIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EmailScreen(),
          ),
        );
      },
      child: Stack(
        children: [
          const SizedBox(
            height: 95,
            width: 100,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 5),
                child: Text(
                  'مساعدة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            child: Image.asset(
              'images/headphone.png',
              width: 80,
            ),
          )
        ],
      ),
    );
  }
}
