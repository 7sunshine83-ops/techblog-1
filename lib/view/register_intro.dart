import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_strings.dart';
import 'package:techblog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.robot.path, height: 100),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.welcom,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailButtomSheet(context, size, textTheme);
                  },

                  child: Text(
                    "بزن بریم",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailButtomSheet(
    BuildContext context,
    Size size,
    TextTheme textTheme,
  ) {
    // RegExp isEmail = RegExp('^[a-z-0-9]+@');
    //یعنی اگه چیزی که نوشته بین اعداد 0تا9 بود و بین حروف آ تا زد بود و بلافاصله بعدش @ اومد یعنی درسته
    //این برای اینه که تشخیص بده اون چیزی که توی باکس ایمیل مینویسیم ایمیل هست یا نه
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      // backgroundColor: Colors.transparent,
      //این برای وقتیه که کانتینر ما با اینکه بهش گفتیم گوشه سمت راست و چپ بالا رو گرد کن گوشه هاش گرد نمیشه
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          //ویواینست اشاره میکنه به زمانی که ما میخوایم از کیبورد استفاده کنیم یعنی وقتی ازکیبورد استفاده میکنیم پایین کانتینرمون بیاد بالای کیبورد
          child: Container(
            height: size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(MyStrings.insertYourEmail, style: textTheme.bodyLarge),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        // print(value + "is Email = " + isEmail.hasMatch(value).toString()); این برای اون حط بالایی هستش که کامنت کردیم
                        print(
                          value + " is Email : " + isEmail(value).toString(),
                        );
                      },
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        //این برای اون متنی هستش که قراره بصورت پیش فرض بذاریم داخل باکسمون
                        hintText:
                            "techblog@gmail.com", //این هینت همون تکستی هستش که بصورت پیش فرض و مثال داخل باکسه
                        hintStyle: textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.pop(context);
                      _activateCodeButtomSheet(context, size, textTheme);
                    }),
                    child: Text("ادامه", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _activateCodeButtomSheet(
    BuildContext context,
    Size size,
    TextTheme textTheme,
  ) {
   
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      // backgroundColor: Colors.transparent,
      //این برای وقتیه که کانتینر ما با اینکه بهش گفتیم گوشه سمت راست و چپ بالا رو گرد کن گوشه هاش گرد نمیشه
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          //ویواینست اشاره میکنه به زمانی که ما میخوایم از کیبورد استفاده کنیم یعنی وقتی ازکیبورد استفاده میکنیم پایین کانتینرمون بیاد بالای کیبورد
          child: Container(
            height: size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(MyStrings.activateCode, style: textTheme.bodyLarge),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        // print(value + "is Email = " + isEmail.hasMatch(value).toString()); این برای اون حط بالایی هستش که کامنت کردیم
                        print(
                          value + " is Email : " + isEmail(value).toString(),
                        );
                      },
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        //این برای اون متنی هستش که قراره بصورت پیش فرض بذاریم داخل باکسمون
                        hintText:
                            "******", //این هینت همون تکستی هستش که بصورت پیش فرض و مثال داخل باکسه
                        hintStyle: textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MyCats()));
                      //پوش ریپلیسمنت برای اینه که دیگه نمیخوایم به صفحه قبلی برگرده
                    }),
                    child: Text("ادامه", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
