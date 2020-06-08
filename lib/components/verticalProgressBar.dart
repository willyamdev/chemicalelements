import 'package:chemicalelements/controlers/elements_type_controller.dart';
import 'package:flutter/material.dart';

class VerticalProgressBar extends StatefulWidget {

  int currentElement;
  int elementsLenght;
  VerticalProgressBar(this.currentElement, this.elementsLenght);

  @override
  _VerticalProgressBarState createState() => _VerticalProgressBarState();
}

class _VerticalProgressBarState extends State<VerticalProgressBar>{

  calculatePercentage(){
    return widget.currentElement * 100 / widget.elementsLenght;
  }

  @override
  Widget build(BuildContext context) {
    calculatePercentage();
    return Container(child: LayoutBuilder(builder: (_, cons) {
      var maxSize = cons.maxHeight / 100;

      return Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(14)),
            width: 7,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(14)),
            width: 7,
            height: maxSize * calculatePercentage(),
          )
        ],
      );
    }));
  }
}
