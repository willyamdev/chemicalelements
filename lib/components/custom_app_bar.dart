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
            type == "home" ? _homeItens() : _elementDetailsItens(context)
          ],
        ),
      ),
    );
  }

  _homeItens() {
    return GestureDetector(
      onTap: () => {print("object")},
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
