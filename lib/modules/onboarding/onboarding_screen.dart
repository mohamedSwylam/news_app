import 'package:news_app/modules/new_layout/new_layout.dart';
import 'package:news_app/shared/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingModel {
  String image;
  String title;
  String body;

  OnBoardingModel({
    @required this.image,
    @required this.title,
    @required this.body,
  });
}

class OnboardingScreen extends StatelessWidget {
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
      image: 'assets/images/journal.png',
      title: 'Welcome To EgyptNews App',
      body: 'All the news of the Egyptian community, cultural, sports, entertainment and health will be here',
    ),
    OnBoardingModel(
      image: 'assets/images/world-news.png',
      title: 'Enjoy Reading HotNews',
      body: 'Read HotNews EveryDays About Sports , Business , Technology',
    ),
    OnBoardingModel(
      image: 'assets/images/television.png',
      title: 'Open Top Channel ',
      body: 'You  Can Open Popular Websites And Read HotNews ',
    ),
  ];
  bool isLast = false;
  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            navigateAndFinish(context, NewScreen());
          }, child: Text('Skip',style: TextStyle(color: Colors.white),),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    isLast = true;
                    print('last');
                  } else {
                    isLast = false;
                    print('not last');
                  }
                },
                itemBuilder: (context, index) {
                  return onBoardingItem(boarding[index]);
                },
                itemCount: boarding.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    spacing: 5,
                    activeDotColor: Colors.teal,
                    expansionFactor: 4,
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast == true) {
                      navigateAndFinish(context, NewScreen());
                    }else{
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750,),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget onBoardingItem(OnBoardingModel model) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
              child: Image(
                image: AssetImage('${model.image}'),
              )),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            maxLines: 1,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${model.body}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
