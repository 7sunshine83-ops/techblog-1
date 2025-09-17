import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/data_models.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_component.dart';
import 'package:techblog/my_strings.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargine = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargine, left: bodyMargine),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  SvgPicture.asset(Assets.images.robot.path, height: 100),
                  SizedBox(height: 16),
                  Text(
                    MyStrings.successfulRegistration,
                    style: textTheme.bodyLarge,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(MyStrings.chooseCat, style: textTheme.bodyLarge),
                  //Taglist
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: ClampingScrollPhysics(),
                        //این فیزیک برای اینه که اسکرول یه قسمتو به اسکرول اول وصل بکنیم که در اسکرول کردنمون دچار مشکل نشیم
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          //این برای فاصله انداختن بین آیتم هاست
                          crossAxisCount: 2,
                          //این برای تعدادش توی ردیفه که بگیم چندتا باشه
                          childAspectRatio: 0.2,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                //میگه اگه سلکتدایندکس شامل تگ لیست با این ایندکس بود بیا ایندکسو بهمون برگردون در غیر اینصورت پرینت کن که وجود دارد
                                if(!selectedTags.contains(tagList[index])){
                                  selectedTags.add(tagList[index]);
                                //این برای اینه که وقتی روی یکی از هشتگ ها کلیک کردیم انتخاب بشن و بیان اون پایین

                                }else{
                                  print("${tagList[index].title} exist");

                                }

                              });
                            },
                            child: MainTags(textTheme: textTheme, index: index),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Image(image: Assets.icons.icon11.provider(), height: 50),
                  // selected Tags
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: ClampingScrollPhysics(),
                        //این فیزیک برای اینه که اسکرول یه قسمتو به اسکرول اول وصل بکنیم که در اسکرول کردنمون دچار مشکل نشیم
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          //این برای فاصله انداختن بین آیتم هاست
                          crossAxisCount: 2,
                          //این برای تعدادش توی ردیفه که بگیم چندتا باشه
                          childAspectRatio: 0.2,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                              color: SolidColors.surface,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  SizedBox(width: 8),
                                  Text(
                                    selectedTags[index].title,
                                    style: textTheme.bodyLarge,
                                  ),
                                  InkWell(
                                    onTap: (() {
                                      setState(() {
                                        selectedTags.removeAt(index);
                                        //ریموات یعنی همون ایندکسی که توش هستیم رو حذف کن
                                        //اینجا ما یه لیستی داریم که میخوایم یسری چیزا ازش حذف بشه ، اسم اون لیست سلکتدتگز هستش و میخوایم یه آیتم رو براساس ایندکس حذف بکنیم
                                      });
                                    }),
                                    child: Icon(CupertinoIcons.delete, color: Colors.grey, size: 20,)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
