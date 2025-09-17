import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_component.dart';
import 'package:techblog/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: Assets.images.user.provider(), height: 100),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.icon6.provider(),
                  color: SolidColors.seeMore,
                ),
                SizedBox(width: 8),
                Text(MyStrings.imageProfileEdit, style: textTheme.bodySmall),
              ],
            ),
        
            SizedBox(height: 60),
            Text("ریحانه وزیرپور", style: textTheme.bodyLarge),
            Text("7sunshine.83@gmail.com", style: textTheme.bodyLarge),
            SizedBox(height: 40),
            //دیوایدر برای بوجود آوردن خط هستش همون خط طوسی های داخل اپ
            TechDivider(size: size),
            //ببین اینجا چون ما چندتا خط میخواستیم دیگه نیومدیم برای هر کدوم جدا کد بنویسیم بجاش میایم توی مای کامپوننت یه دیوایدر درست میکنیم وهروقت خواستیم ازش استفاده میکنیم
            InkWell(
              onTap: (() {
                //اینجا قراره یچیزی اجرا بشه
              }),
              splashColor: SolidColors.primaryColor,
              // این مال وقتیه که وقتی رو دکمه میزنیم دیگه اون حالت موجش طوسی نباشه بلکه رنگ پرایمری کالرباشه
              child: SizedBox(
                height: 45,
                child: Center(
                  //اگه سنتر نیاشه اون ارتفاع 45 برای ما کار نمیکنه
                  child: Text(
                    MyStrings.myFavoritBlog,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: (() {
              }),
              splashColor: SolidColors.primaryColor,
              // این مال وقتیه که وقتی رو دکمه میزنیم دیگه اون حالت موجش طوسی نباشه بلکه رنگ پرایمری کالرباشه
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavoritPodcast,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: (() {
              }),
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.logOut,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          
            SizedBox(height:60,),
          ],
        ),
      ),
    );
  }
}
