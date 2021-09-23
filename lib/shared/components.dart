import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/web_view/webview_screen.dart';

Widget buildHeadlinesItem(article,context) =>
    InkWell(
      onTap: (){
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    '${article['urlToImage']}'),
              ),
            ),
          ),
          Container(
            width: 350,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(

                  /*decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.white.withOpacity(0.0)
                        ]),
                  ),*/
                  child: Text(
                    '${article['title']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  color: Colors.black54,
                ),
                Container(
                  /*decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.white.withOpacity(0.0)
                        ]),
                  ),*/
                  child: Text('${article['publishedAt']}',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.subtitle2),
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget buildBusinessItem(article,context) =>
    InkWell(
      onTap: (){
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${article['urlToImage']}}'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${article['title']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10
                  , left: 8),
              child: Text(
                '${article['publishedAt']}',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildSourceItem(article,context) =>
    InkWell(
      onTap: (){
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '${article['urlToImage']}'),
                ),
              ),
            ),
            SizedBox(width: 14,),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start
                  ,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText2,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildCircleAvatar(article,context) =>
    InkWell(
      onTap: (){
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      '${article['urlToImage']}'),
                  radius: 33,
                ),
                SizedBox(height: 7,),
                Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  '${article['type']}',
                  style: TextStyle(
                      fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
Widget defaultFormField({
  Color cursorColor,
  @required TextInputType type,
  @required TextEditingController controller,
  @required String labelText,
  Color labelColor,
  double borderRaduis,
  Color borderColor,
  IconData prefix,
  Color iconColor,
  Color focusColor,
  Color fillcolor,
  double focusedBorderRaduis,
  Color focusdborderColor,
  double enabledBorderRaduis,
  Color enabledBorderColor,
  double errorBorderRaduis,
  Color errorBorderColor,
  @required Function  validate,
  Function  onTap,
  Function  onchange,
}) =>
    TextFormField(
      style: TextStyle(
        color: Colors.teal,
      ),
     onChanged: onchange,
      onTap: onTap,
      validator: validate,
      cursorColor: cursorColor,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: labelColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRaduis),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        prefixIcon: Icon(
          prefix,
          color: iconColor,
        ),
        focusColor: focusColor,
        fillColor: fillcolor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(focusedBorderRaduis),
          borderSide: BorderSide(
            color: focusdborderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(enabledBorderRaduis),
          borderSide: BorderSide(
            color: enabledBorderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(errorBorderRaduis),
          borderSide: BorderSide(
            color: errorBorderColor,
          ),
        ),
      ),
    );
void navigateTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>widget,
    ));
void navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) =>widget,
    ),
    (route){
      return false;
    }
);

Widget buildSource(list,context,{isSearch=false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context)=>ListView.separated(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildSourceItem(list[index],context),
      separatorBuilder: (context, index) => SizedBox(
        width: 1,
      ),
      itemCount:10,),
  fallback: (context)=> isSearch ? Container () : Center(child: CircularProgressIndicator()) ,
);

