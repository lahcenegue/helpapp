import 'package:flutter/material.dart';
import 'package:helpapp/constatns/colors.dart';
import 'package:helpapp/constatns/help_name.dart';
import 'package:helpapp/screens/help_screen.dart';

class HelpTools extends StatelessWidget {
  const HelpTools({super.key});

  @override
  Widget build(BuildContext context) {
    HelpToolsNames data = HelpToolsNames();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          title: const Text('وسائل الدعم'),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: data.helpToolsNames.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
              child: ElevatedButton(
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HelpScreen(
                        title: data.helpToolsNames[index],
                      ),
                    ),
                  );
                },
                child: Text(
                  data.helpToolsNames[index],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
