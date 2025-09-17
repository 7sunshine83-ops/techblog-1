import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/view/main_screen.dart';
import 'package:techblog/view/my_cats.dart';
import 'package:techblog/view/register_intro.dart';

void main() {
  //این سیستم کروم برای اینه که اون باتم نویگیشن که دکمه بک و اینارو داره با اون کشوی بالای صفحه که اینترنت و اینا توشه رنگشون با یوآی ست بشه
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      //این برای اینه که آیکون های بالارو تیره کنه رنگشو اگه سفید بود
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // farsi
      ],
      theme: ThemeData(
        inputDecorationTheme:InputDecorationTheme(
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width:2),

          ),
          filled: true,
          fillColor: Colors.white,//این فیل کالر برای اینه که خودمون یه رنگی به تکست فیلدمون بدیم
            
        ) , //این برای اینه که تم تکست فیلدمون رو در سرتاسر پروژه اعمال بکنه
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<OutlinedBorder>(
              BeveledRectangleBorder(),
            ),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return textTheme.headlineMedium;
              }
              return textTheme.titleMedium;
            }),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return SolidColors.seeMore;
              }
              return SolidColors.primaryColor;
            }),
          ),
        ),
        fontFamily: 'dana',
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: SolidColors.posterTitle,
          ),
          titleMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubTitle,
          ),

          bodyMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),

          headlineSmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: SolidColors.seeMore,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          headlineLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: SolidColors.hintText,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: MyCats(),
    );
  }
}
