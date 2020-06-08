import 'package:chemicalelements/controlers/elements_type_controller.dart';
import 'package:chemicalelements/models/chemical_element.dart';
import 'package:chemicalelements/view/element_details.dart';
import 'package:flutter/material.dart';

class ElementsPageView extends StatefulWidget {
  final ValueChanged<int> onChangeElement;
  List<ChemicalElement> elementsList;
  ElementsPageView({this.onChangeElement, this.elementsList});

  @override
  _ElementsPageViewState createState() => _ElementsPageViewState();
}

class _ElementsPageViewState extends State<ElementsPageView>
    with ElementsTypeController {
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
        return _elementCell(widget.elementsList[i]);
      },
    );
  }

  _elementCell(ChemicalElement chemicalElement) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (_, __, ___) => ElementDetails(chemicalElement),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: <Widget>[
            Hero(
              tag: chemicalElement.chemicalSymbol + 'bg',
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: getElementColor(chemicalElement.elementType)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _chemicalSymbolContainer(chemicalElement.chemicalSymbol),
                  SizedBox(height: 10),
                  _elementTypeContainer(chemicalElement.elementType,
                      chemicalElement.chemicalSymbol),
                  _elementName(chemicalElement.elementName,
                      chemicalElement.chemicalSymbol)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _chemicalSymbolContainer(String symbol) {
    return Hero(
      tag: symbol + "info",
      child: Material(
        type: MaterialType.transparency,
        child: Container(
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
        ),
      ),
    );
  }

  _elementTypeContainer(int type, String symbol) {
    return Hero(
      tag: symbol + "type",
      child: Material(
        type: MaterialType.transparency,
        child: Text(getElementType(type),
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'Quicksand',
            )),
      ),
    );
  }

  _elementName(String name, String symbol) {
    return Hero(
      tag: symbol + "name",
      child: Material(
        type: MaterialType.transparency,
        child: Text(name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
