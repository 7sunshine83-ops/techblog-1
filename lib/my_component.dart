//این کامپوننت برای اینه که اگه قراره ما بیایم یچیزی رو خیلی تکرارش کنیم توی صفحه از این راه بریم جلو

import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      //این صخامت خط رو مشخص میکنه
      color: SolidColors.dividerColor,
      indent:size.width/6 ,
      //میاد یسری فاصله از کناره خط ها میده که /قدر از کنار فاصله داشته باشن
      endIndent: size.width/6,
      //این یعنی پایان این خط چقدر فاصله داشته باشه از کنار
    );
  }
}

//این برای ظاهر و شکل باکس های هشتگ هامون هستش
class MainTags extends StatelessWidget {
   MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  var index;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
        gradient: LinearGradient(
          colors: GradiantColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.icon1.provider(),
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 8),
            Text(
              tagList[index].title,
              style: textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}