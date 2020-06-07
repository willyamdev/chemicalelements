import 'package:chemicalelements/components/custom_app_bar.dart';
import 'package:chemicalelements/components/elements_page_view.dart';
import 'package:chemicalelements/components/verticalProgressBar.dart';
import 'package:chemicalelements/helpers/screen_helper.dart';
import 'package:chemicalelements/models/elements_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentElement = 0;
  ScreenHelper screenHelper;
  ElementsList elementsList = ElementsList();

  @override
  Widget build(BuildContext context) {
    screenHelper = ScreenHelper(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Container(
        width: screenHelper.width,
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_titleApp(), _pageViewContainer()],
        ),
      ),
    );
  }

  _titleApp() {
    return Text(
      "Elementos químicos",
      style: TextStyle(
          fontSize: 30, fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
    );
  }

  _pageViewContainer() {
    return Expanded(child: LayoutBuilder(builder: (_, cons) {
      var gridX = cons.maxWidth / 100;
      var gridY = cons.maxHeight / 100;
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: gridY * 3),
            height: gridY * 70,
            child: Row(
              children: <Widget>[
                Container(
                  width: gridX * 15,
                  child: Column(
                    children: <Widget>[
                      Text(
                        currentElement == 0 ? "1" : (currentElement + 1).toString(),
                        style: TextStyle(
                            fontFamily: 'Quicksand', color: Colors.red),
                      ),
                      SizedBox(height: 5),
                      Expanded(child: VerticalProgressBar(currentElement + 1, elementsList.elementsList.length)),
                      SizedBox(height: 5),
                      Text(
                        elementsList.elementsList.length.toString(),
                        style: TextStyle(fontFamily: 'Quicksand'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: gridX * 85,
                    child: ElementsPageView(onChangeElement: (ei) {
                      setState(() {
                        currentElement = ei;
                      });
                    },
                    elementsList: elementsList.elementsList,
                    ))
              ],
            ),
          ),
          Container(
            height: gridY * 27,
          ),
        ],
      );
    }));
  }
}
