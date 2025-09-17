import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  //وقتی بخوایم این حالتو دربیاریم که وقتی روی فلان دکمه زدی
  // برو توی فلان صفحه باید از استیت فول ویجت استفاده کنیم
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
  //این خط رو نباید داخل متد بیلد بنویسیم چون وقتی رو دکمه ها بزنیم
  // دوباره از اول اجرا میشه و به ما مقدار 0 رو برمیگردونه
  //و بنابراین هرچی روی دکمه یوزر بزنیم نمیره داخل صفحه یوزر

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    //این برای وقتیه که میخوایم یه مارجینی رو یه کل بادیمون بدیم

    return SafeArea(
      child: Scaffold(
        key: _key,
        //این برای همون دکمه منو هستش که وقتی روی اون چندخط میزنیم اون کشو سمت راستی رو باز کنه برامون
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin,right: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide.none),
                  ),
                  child: Center(
                    child: Image(
                      image: Assets.images.logo.provider(),
                      height: 100,
                    ),
                  ),
                ),
                ListTile(title: Text("پروفایل کاربری"), onTap: (() {})),
                Divider(color: SolidColors.dividerColor),
                ListTile(title: Text("درباره تک‌ بلاگ"), onTap: (() {})),
                Divider(color: SolidColors.dividerColor),
                ListTile(title: Text("اشتراک گذاری تک بلاگ"), onTap: (() {})),
                Divider(color: SolidColors.dividerColor),
                ListTile(title: Text("تک بلاگ در گیت هاب"), onTap: (() {})),
                Divider(color: SolidColors.dividerColor),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //اپ بار همیشه ثابته
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (() {
                  _key.currentState!.openDrawer();
                }),
                child: Icon(Icons.menu, color: Colors.black)),
              Image(
                image: Assets.images.logo.provider(),
                height: size.height / 13.6,
              ),
              Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                    size: size,
                    textTheme: textTheme,
                    bodyMargin: bodyMargin,
                  ), //0
                  ProfileScreen(
                    size: size,
                    textTheme: textTheme,
                    bodyMargin: bodyMargin,
                  ), //1
                ],
              ),
            ),

            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                  //این ولیو اسم اینتمون هستش و مقدارش هموناس که توی کلاس باتم نویگیشن
                  //برای آیکون یوزر و هوم نوشتیم
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen; //چنج اسکرین اسم فانکشنمون هستش
  //یعنی تو بعنوان فانکشن باید یه ورودی اینتجر رو بگیری و پاس بدی به کلاس پَرِنت چون نوع سلکتد پیح ایندکس از نوع اینت هستش

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(colors: GradiantColors.bottomNav),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (() => changeScreen(0)),
                  //اینجا بهش میگیم چنج اسکرین مقدار صفر رو بهم پاس بده چون صفحه هوم مقدار صفرروداره
                  icon: ImageIcon(
                    Assets.icons.icon5.provider(),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: (() {}),
                  icon: ImageIcon(
                    Assets.icons.icon4.provider(),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: ImageIcon(
                    Assets.icons.icon10.provider(),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
