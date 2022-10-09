import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:helpapp/constatns/colors.dart';
import 'package:helpapp/screens/map_screen.dart';

class HelpScreen extends StatefulWidget {
  final String title;
  const HelpScreen({
    super.key,
    required this.title,
  });

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final messageTitle = TextEditingController();
  final message = TextEditingController();
  double? latitude;
  double? longitude;

  bool? islocated = false;
  bool? isSended = false;
  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          title: const Text('إنشاء بلاغ'),
          centerTitle: true,
        ),
        body: latitude == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                        textAlign: TextAlign.center,
                        ' مرحبا بك، \n   ${widget.title}  في خدمتك'),
                    const SizedBox(height: 50),
                    TextField(
                      controller: messageTitle,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "موضوع الطلب ",
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: message,
                      keyboardType: TextInputType.text,
                      maxLines: 4,
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
                    // const SizedBox(height: 20),
                    // Container(
                    //   padding: const EdgeInsets.all(30),
                    //   height: 200,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white.withOpacity(0.6),
                    //     borderRadius: BorderRadius.circular(30),
                    //     border: Border.all(
                    //       width: 2,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   child: Visibility(
                    //     visible: true,
                    //     child: Center(
                    //       child: Text(
                    //         'my location is: \nlong: $latitude  \nlant:$longitude , ${messageTitle.text} \n  ${message.text} ',
                    //         style: const TextStyle(fontSize: 20),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: 50,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.scondColor,
                            shadowColor: Colors.black,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: const Size(60, 60),
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.5),
                            )),
                        child: const Text('تأكيد الموقع'),
                        onPressed: () {
                          setState(() {});
                          if (latitude == null) {
                            getCurrentLocation();
                          }
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MapScreen(
                                      lat: latitude!,
                                      lan: longitude!,
                                    )),
                          );
                          islocated = true;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
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
                      child: const Text('ارسال الطلب'),
                      onPressed: () {
                        setState(() {});

                        if (islocated == true) {
                          if (messageTitle.text.isNotEmpty) {
                            if (message.text.isNotEmpty) {
                              isSended = true;
                            } else {
                              SnackBar snackBar = const SnackBar(
                                content: Text('يرجى كتابة  طلبك'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          } else {
                            SnackBar snackBar = const SnackBar(
                              content: Text('يرجى كتابة موضوع الطلب'),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          SnackBar snackBar = const SnackBar(
                            content:
                                Text('يرجى منك تأكيد موقعك قبل إرسال الطلب'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
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
                      child: Visibility(
                        visible: isSended == true ? true : false,
                        child: const Center(
                          child: Text(
                            'لقد تم تلقي رسالتك بنجاح، سيتم الوصول اليك قريبا',
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

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      longitude = position.longitude;
      latitude = position.latitude;
    });
  }
}
