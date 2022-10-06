import 'package:flutter/material.dart';
import 'package:helpapp/constatns/colors.dart';
import 'package:helpapp/screens/forgot_screen.dart';
import 'package:helpapp/screens/help_tools.dart';
import 'package:helpapp/screens/register_screen.dart';
import 'package:helpapp/widgets/help_icon.dart';
import 'package:helpapp/widgets/login_desing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('تسجيل الدخول'),
            centerTitle: true,
            backgroundColor: AppColors.appbarColor,
          ),
          body: Stack(
            children: [
              SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const LoginDesing(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   'مساعدة و إنقاذ',
                        //   style: TextStyle(
                        //     color: AppColors.textColor,
                        //     fontSize: 32,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // Text(
                        //   'لدعم الصم و البكم',
                        //   style: TextStyle(
                        //     color: AppColors.textColor,
                        //     fontSize: 24,
                        //   ),
                        // ),
                        // const SizedBox(height: 50),
                        Container(
                          height: screenHeight * 0.40,
                          width: screenWidth * 0.75,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.scondColor,
                                blurRadius: 4,
                                offset: const Offset(4, 8), // Shadow position
                              ),
                            ],
                            border: Border.all(
                              width: 2,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 45,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'رقم الهوية',
                                      contentPadding: const EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: _obscureText,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey.shade100,
                                        filled: true,
                                        hintText: 'كلمة المرور',
                                        contentPadding: const EdgeInsets.only(
                                            left: 15,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                            icon: Icon(_obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility))),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgorScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'نسيت كلمة المرور',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'تسجيل جديد',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.buttonColor.withOpacity(0.8),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const HelpTools(),
                                      ),
                                    );
                                  },
                                  child: const Text('دخول'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Positioned(
                top: 10,
                left: 10,
                child: HelpIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
