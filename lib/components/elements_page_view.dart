import 'package:chemicalelements/models/chemical_element.dart';
import 'package:flutter/material.dart';

class ElementsPageView extends StatefulWidget {
  final ValueChanged<int> onChangeElement;
  List<ChemicalElement> elementsList;
  ElementsPageView({this.onChangeElement, this.elementsList});

  @override
  _ElementsPageViewState createState() => _ElementsPageViewState();
}

class _ElementsPageViewState extends State<ElementsPageView> {
  int currentElement = 0;
  PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _initilizeAppController());
  }

  _initilizeAppController() {
    _pageController.addListener(() {
      int next = _pageController.page.round();

      if (currentElement != next) {
        setState(() {
          currentElement = next;
        });
        widget.onChangeElement(currentElement);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.elementsList.length,
      itemBuilder: (c, i) {
        return _elementCell(
          widget.elementsList[i].elementName,
          widget.elementsList[i].chemicalSymbol,
          widget.elementsList[i].elementType,
        );
      },
    );
  }

  _elementCell(String elementName, String elementSymbol, int elementType) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _chemicalSymbolContainer(elementSymbol),
          SizedBox(height: 10),
          _elementTypeContainer(elementType),
          _elementName(elementName)
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: _getElementColor(elementType)),
      padding: EdgeInsets.all(20),
    );
  }

  _chemicalSymbolContainer(String symbol) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(0, 0, 0, 0.4),
      ),
      child: Center(
          child: Text(
        symbol,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      )),
    );
  }

  _elementTypeContainer(int type) {
    return Text(_getElementType(type),
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontFamily: 'Quicksand',
        ));
  }

  _elementName(String name) {
    return Text(name,
        style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold));
  }

  _getElementType(int type) {
    String elementType;

    switch (type) {
      case 1:
        elementType = "Não metal";
        break;
      case 2:
        elementType = "Gás nobre";
        break;
      case 3:
        elementType = "Metal alcalino";
        break;
      case 4:
        elementType = "Metal alcalino terroso";
        break;
      case 5:
        elementType = "Semimetal";
        break;
      case 6:
        elementType = "Halogênio";
        break;
      case 7:
        elementType = "Outros metais";
        break;
      case 8:
        elementType = "Metal de transição";
        break;
      case 9:
        elementType = "Lantanídeo";
        break;
      case 10:
        elementType = "Actinídio";
        break;
    }

    return elementType;
  }

  _getElementColor(int type) {
    Color elementColor;

    switch (type) {
      case 1:
        elementColor = Colors.green;
        break;
      case 2:
        elementColor = Colors.blue;
        break;
      case 3:
        elementColor = Colors.orange;
        break;
      case 4:
        elementColor = Colors.yellow;
        break;
      case 5:
        elementColor = Colors.blueGrey;
        break;
      case 6:
        elementColor = Colors.blueAccent;
        break;
      case 7:
        elementColor = Colors.lime;
        break;
      case 8:
        elementColor = Colors.pink;
        break;
      case 9:
        elementColor = Colors.lightGreen;
        break;
      case 10:
        elementColor = Colors.purple;
        break;
    }

    return elementColor;
  }
}
