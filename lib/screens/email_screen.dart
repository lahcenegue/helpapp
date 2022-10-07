import 'package:flutter/material.dart';
import 'package:helpapp/constatns/colors.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('المساعدة'),
          centerTitle: true,
          backgroundColor: AppColors.appbarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'البريد الالكتروني',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'الموضوع',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                maxLines: 8,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  labelText: 'الرسالة',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.scondColor,
                    shadowColor: Colors.black,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(200, 60),
                    side: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                    )),
                onPressed: () {},
                child: const Text('ارسال'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
