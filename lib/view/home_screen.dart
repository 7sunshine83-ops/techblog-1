import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_component.dart';
import 'package:techblog/my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            HomePagePoster(size: size, textTheme: textTheme),
    
            SizedBox(height: 16),
            //tag list
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
    
            SizedBox(height: 32),
            
            //see more
            //written part
            SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),

            //blog list
            HomePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
    
            SizedBox(height: 32),
    
            //podcasts part
            SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),

            HomePagePodcastList(size: size, bodyMargin: bodyMargin),
          
          SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: podcastList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          //podcast item
          return Padding(
            padding: EdgeInsets.only(
              right: index == 0 ? bodyMargin : 15,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.4,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                podcastList[index].imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    podcastList[index].title,
                    //این میگه اگه تکست ما اونقدری زیاده که قراره اورفلو کنه تو بیا آخر این تکست سه نقطه بذار برای این که اورفلو نکنه
                    overflow: TextOverflow.ellipsis,
                    //یعنی حدکثر خطط 2تا باشه
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.mic.provider(),
            color: SolidColors.seeMore,
          ),
          SizedBox(width: 8),
          Text(
            MyStrings.vieHotestPodcasts,
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          //blog item
          return Padding(
            padding: EdgeInsets.only(
              right: index == 0 ? bodyMargin : 15,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.4,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                blogList[index].imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: GradiantColors.blogPost,
                            ),
                          ),
                        ),
        
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: textTheme.titleMedium,
                              ),
                              // این بعلاوه برای اینه که بهش بگیم بلافاصله بعدش بیا دیت رو برای من بخون
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views,
                                    style:
                                        textTheme.titleMedium,
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    blogList[index].title,
                    //این میگه اگه تکست ما اونقدری زیاده که قراره اورفلو کنه تو بیا آخر این تکست سه نقطه بذار برای این که اورفلو نکنه
                    overflow: TextOverflow.ellipsis,
                    //یعنی حدکثر خطط 2تا باشه
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.icon6.provider(),
            color: SolidColors.seeMore,
          ),
          SizedBox(width: 8),
          Text(
            MyStrings.vieHotestBlog,
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              8,
              index == 0 ? bodyMargin : 15,
              8,
            ),
            child: MainTags(textTheme: textTheme, index: index,),
          );
        },
      ),
    );
  }
}



class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(
                homePagePosterMap["imageAsset"],
              ),
              fit: BoxFit.cover,
            ),
          ),
          //فورگراند برای اینه که بجای اینکه بیایم از یه کانتینر دیگه برای گردینت استفاده بکنیم میایم از یه کانتینر استفاده میکنیم که کدمون بهینه بشه
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              colors: GradiantColors.homePosterCoverGradianr,
              //بگین و اند برای اینه که مشخص کنیم از کجا تا کجاباشه گردینتمون
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.titleMedium,
                  ),
                  // این بعلاوه برای اینه که بهش بگیم بلافاصله بعدش بیا دیت رو برای من بخون
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["view"],
                        style: textTheme.titleMedium,
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "دوازده قدم برنامه نویسی یک دوره ی ... س",
                style: textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}