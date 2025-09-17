import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/main_screen.dart';
import 'package:techblog/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //این قسمت پایین برای این قسمتی هستش که بهش بگیم مثلا چندثانیه صبر بکنه و بعدش بره توی فلان صفحه
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((vslue) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          //اینجا میگیم با استفاده از پوش و متریال پیج روت برو به صفحه مین اسکرین
          builder: (context) => MainScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: Assets.images.logo.provider(), height: 64),
              SizedBox(height: 32),
              SpinKitFadingCube(color: SolidColors.primaryColor, size: 32),
            ],
          ),
        ),
      ),
    );
  }
}
