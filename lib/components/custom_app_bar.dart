import 'package:chemicalelements/components/custom_search_delegate.dart';
import 'package:chemicalelements/models/chemical_element.dart';
import 'package:chemicalelements/view/element_details.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String type;
  CustomAppBar(this.type);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(right: 10),
        height: 50,
        child: Row(
          mainAxisAlignment:
              type == "home" ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            type == "home" ? _homeItens(context) : _elementDetailsItens(context)
          ],
        ),
      ),
    );
  }

  _homeItens(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        ChemicalElement result = await showSearch(
            context: context, delegate: CustomSearchDelegate());

        if (result != null) {
          Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => ElementDetails(result),
              ));
        }
      },
      child: Container(
        child: Icon(
          Icons.search,
          size: 25,
        ),
      ),
    );
  }

  _elementDetailsItens(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pop(context)},
      child: Container(
        child: Icon(
          Icons.arrow_back_ios,
          size: 25,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
