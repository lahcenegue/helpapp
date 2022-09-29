import 'package:flutter/material.dart';
import 'package:helpapp/constatns/colors.dart';

class HelpScreen extends StatelessWidget {
  String title;
  HelpScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          title: Text(title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: ListView(
            children: [
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(30),
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: const Visibility(
                  visible: true,
                  child: Center(
                    child: Text(
                      'my location is: \nlong: 34.45566777  \nlant:0.54543534535',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "اكتب رسالتك هنا ... ",
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
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
                    minimumSize: const Size(100, 60),
                    side: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                    )),
                onPressed: () {},
                child: const Text('ارسال الموقع'),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(30),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: const Visibility(
                  visible: true,
                  child: Center(
                    child: Text(
                      'لقد تم تلقي موقعك بنجاح، سيتم الوصول اليك قريبا',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      )),
    );
  }
}
